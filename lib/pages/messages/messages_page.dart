import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/components/chat_cell.dart';
import 'package:t4t/components/header_with_back_button.dart';
import 'package:t4t/components/mini_post.dart';
import 'package:t4t/components/profile_sheet.dart';
import 'package:t4t/components/system_tap.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/message_data.dart';
import 'package:t4t/data/post_min_data.dart';
import 'package:t4t/data/profile_min_data.dart';
import 'package:t4t/design_system/system_error.dart';
import 'package:t4t/design_system/system_icon_button.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/design_system/system_text_field.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/extensions/color_extensions.dart';
import 'package:t4t/extensions/profile_extensions.dart';
import 'package:t4t/extensions/profile_min_extensions.dart';
import 'package:t4t/extensions/strings_extensions.dart';
import 'package:t4t/providers/conversations_provider.dart';
import 'package:t4t/providers/messages_provider.dart';
import 'package:t4t/providers/profile_provider.dart';
import 'package:t4t/providers/resolved_brightness_provider.dart';
import 'package:t4t/repositories/messages_repository.dart';
import 'package:t4t/utils/dialogs.dart';
import 'package:t4t/utils/network_utils.dart';
import 'package:uuid/uuid.dart';

class MessagePageData {
  const MessagePageData(
      {required this.profile,
      this.post,
      this.embedded = false,
      this.unread = false});

  final ProfileMinData profile;
  final PostMinData? post;
  final bool embedded;
  final bool unread;
}

class MessagePageLocalData {
  const MessagePageLocalData({required this.text, this.title, this.body});

  final String text;
  final String? title;
  final String? body;
}

class MessagesPage extends ConsumerStatefulWidget {
  const MessagesPage({super.key, required this.data});

  final MessagePageData data;

  @override
  ConsumerState<MessagesPage> createState() => _MessagesConversationPageState();
}

class _MessagesConversationPageState extends ConsumerState<MessagesPage>
    with WidgetsBindingObserver {
  TextEditingController textEditingController = TextEditingController();

  bool _deliveringText = false;

  bool showPost = true;

  String? messageText;
  Timer? pollTimer;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        FocusScope.of(context).requestFocus(_focusNode);
      }
    });

    updatePostFromPrefs();

    if (widget.data.unread) {
      MessagesRepository.sendReads(widget.data.profile.id).then((_) {
        ref
            .read(conversationsProvider.notifier)
            .setRead(widget.data.profile.id);
      });
    }
  }

  @override
  void dispose() {
    endPollTimers();
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  void endPollTimers() {
    if (pollTimer != null) {
      pollTimer!.cancel();
      pollTimer = null;
    }
  }

  void setPollTimers() {
    ref
        .read(messagesProvider(widget.data.profile.id).notifier)
        .poll(widget.data.profile.id);

    if (pollTimer != null) {
      pollTimer!.cancel();
    }

    pollTimer ??=
        Timer.periodic(const Duration(seconds: pollingTime), (Timer t) {
      if (mounted) {
        ref
            .read(messagesProvider(widget.data.profile.id).notifier)
            .poll(widget.data.profile.id);
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        setPollTimers();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        endPollTimers();
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  Future<void> updatePostFromPrefs() async {
    textEditingController.text =
        prefs.getString(prefsMessage + widget.data.profile.id) ?? '';
  }

  Future<void> _sendMessage() async {
    if (!_deliveringText && messageText != null && messageText!.isNotEmpty) {
      String sendText = messageText!.trim();
      messageText = null;
      textEditingController.clear();
      MessageData message = MessageData(
          tempId: const Uuid().v4(),
          postTitle: showPost && widget.data.post != null
              ? widget.data.post!.title
              : null,
          postBody: showPost && widget.data.post != null
              ? widget.data.post!.body
              : null,
          text: sendText,
          senderId: Supabase.instance.client.auth.currentSession!.user.id,
          receiverId: widget.data.profile.id,
          createdAt: DateTime.now().toUtc(),
          read: false);

      setState(() {
        _deliveringText = true;

        ref
            .read(messagesProvider(widget.data.profile.id).notifier)
            .add(message);

        prefs.setString(prefsMessage + widget.data.profile.id, '');
      });

      HapticFeedback.lightImpact();

      await NetworkUtils.safeNetworkCall(context, () {
        return Supabase.instance.client
            .from('messages')
            .insert({
              'sender_id':
                  Supabase.instance.client.auth.currentSession!.user.id,
              'receiver_id': widget.data.profile.id,
              'text': sendText,
              'post_id': showPost && widget.data.post != null
                  ? widget.data.post!.id
                  : null,
              'post_title': showPost && widget.data.post != null
                  ? widget.data.post!.title
                  : null,
              'post_body': showPost && widget.data.post != null
                  ? widget.data.post!.body
                  : null
            })
            .select('id')
            .single();
      }, (value) {
        ref
            .read(conversationsProvider.notifier)
            .messageSent(widget.data.profile, sendText);

        message = message.copyWith(id: value['id']);
        ref
            .read(messagesProvider(widget.data.profile.id).notifier)
            .updateMessage(message);

        setState(() {
          showPost = false;
        });
      }, () {
        setState(() {
          showPost = true;
          ref
              .read(messagesProvider(widget.data.profile.id).notifier)
              .remove(message);
        });
      }, false);

      setState(() {
        _deliveringText = false;
      });
    }
  }

  bool nextPostFromSameSender(int i, List<MessageData> messages) {
    if (i == messages.length - 1) {
      return true;
    } else {
      return messages[i].senderId == messages[i + 1].senderId;
    }
  }

  double getTopMarginForPreviousPostType(bool previewPostFromSelf) {
    return previewPostFromSelf ? spacingFour : spacingSix;
  }

  void removePost() {
    setState(() {
      showPost = false;
    });
  }

  void showProfile() {
    ProfileSheet().show(context, widget.data.profile, true, true, () {
      setState(() {
        showPost = true;
      });
    }, null);
  }

  bool isAllEmoji(String text) {
    for (String s in EmojiParser().unemojify(text).split(' ')) {
      if (!s.startsWith(':') || !s.endsWith(':')) return false;
    }
    return true;
  }

  Widget chatCell(MessageData message, bool otherUser) {
    final text = message.text.trim();

    return SystemTap(
        child: isAllEmoji(text)
            ? Row(
                mainAxisAlignment:
                    otherUser ? MainAxisAlignment.start : MainAxisAlignment.end,
                children: [
                    SystemText(size: TextSizeEnum.twentyNine, text: text)
                  ])
            : ChatCell(
                verticalPadding: 8,
                text: text,
                alignment: otherUser
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.end),
        onLongPress: () {
          Dialogs.message(context, ref, message, widget.data.profile.id);
        });
  }

  void setSharedPrefsText() async {
    if (messageText != null) {
      prefs.setString(prefsMessage + widget.data.profile.id, messageText!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.read(profileProvider).value!;
    final AsyncValue<List<MessageData>> messages =
        ref.watch(messagesProvider(widget.data.profile.id));

    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              HeaderWithBackButton(
                  titleAction: () => showProfile(),
                  title: widget.data.profile.decoratedUsername(),
                  color: widget.data.profile.color
                      .adjusted(ref.watch(resolvedBrightnessProvider))),
              Flexible(
                  child: switch (messages) {
                AsyncData(value: final messagesValue) => ListView.builder(
                    reverse: true,
                    padding:
                        const EdgeInsets.symmetric(horizontal: spacingFive),
                    itemCount: messagesValue.length,
                    itemBuilder: (context, i) {
                      final message = messagesValue[i];

                      if (i == messagesValue.length - 1 &&
                          messagesValue.length % fetchQty == 0) {
                        ref
                            .read(messagesProvider(widget.data.profile.id)
                                .notifier)
                            .scroll(widget.data.profile.id);
                      }

                      if (i == 0 &&
                          message.id != null &&
                          message.receiverId ==
                              Supabase.instance.client.auth.currentSession!.user
                                  .id) {
                        MessagesRepository.sendRead(message.id!).then((value) {
                          ref
                              .read(conversationsProvider.notifier)
                              .setRead(widget.data.profile.id);
                        });
                      }

                      return Padding(
                          padding: EdgeInsets.only(
                              top: getTopMarginForPreviousPostType(
                                  nextPostFromSameSender(i, messagesValue))),
                          child: Column(children: [
                            if (i == messagesValue.length - 1 &&
                                messagesValue.length % fetchQty == 0)
                              SystemLoader(
                                color: widget.data.profile.color,
                              ),
                            if (message.postTitle != null)
                              MiniPost(
                                  profile: message.receiverId.isOwnId()
                                      ? profile.min()
                                      : widget.data.profile,
                                  post: PostMinData(
                                      title: message.postTitle!,
                                      body: message.postBody!),
                                  fromSelf: message.receiverId != profile.id),
                            chatCell(message, message.receiverId == profile.id),
                            if (i == 0 && message.senderId == profile.id)
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: spacingFour),
                                        child: SystemText(
                                          text: message.read
                                              ? AppLocalizations.of(context)!
                                                  .read
                                              : _deliveringText
                                                  ? AppLocalizations.of(
                                                          context)!
                                                      .delivering
                                                  : AppLocalizations.of(
                                                          context)!
                                                      .delivered,
                                          color: profile.color.adjusted(
                                              ref.watch(
                                                  resolvedBrightnessProvider)),
                                          size: TextSizeEnum.twelve,
                                        ))
                                  ])
                          ]));
                    },
                  ),
                AsyncError() => SystemError(
                    onPressed: () => ref
                        .invalidate(messagesProvider(widget.data.profile.id))),
                _ => SystemLoader(
                    color: widget.data.profile.color
                        .adjusted(ref.watch(resolvedBrightnessProvider))),
              }),
              if (widget.data.post != null && showPost && !_deliveringText)
                Padding(
                    padding: const EdgeInsets.only(
                        right: spacingFive, top: spacingFive),
                    child: Stack(children: [
                      Opacity(
                          opacity: 0.75,
                          child: MiniPost(
                              profile: profile.min(),
                              post: PostMinData(
                                  title: widget.data.post!.title,
                                  body: widget.data.post!.body),
                              fromSelf: true)),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        SystemIconButton(
                            size: SystemIconButtonSize.small,
                            icon: PhosphorIcons.x_thin,
                            filledIcon: PhosphorIcons.x_fill,
                            onPressed: () => removePost())
                      ])
                    ])),
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onVerticalDragEnd: (details) {
                    if (details.primaryVelocity != null &&
                        details.primaryVelocity! > 10) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: spacingFive, horizontal: spacingFive),
                      child: SystemTextField(
                        editingAction: () {},
                        autoFocus: true,
                        textInputAction: TextInputAction.send,
                        suffixIcon: messageText == null || messageText!.isEmpty
                            ? null
                            : PhosphorIcons.arrow_circle_up_thin,
                        onSuffixTapped: () {
                          _sendMessage();
                        },
                        onSubmitted: (p0) {
                          _sendMessage();
                        },
                        primaryColor: profile.color
                            .adjusted(ref.watch(resolvedBrightnessProvider)),
                        secondaryColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        textEditingController: textEditingController,
                        onChanged: (p0) {
                          if (p0 != null) {
                            if (messageText == null ||
                                messageText!.isEmpty && p0.isNotEmpty ||
                                messageText!.isNotEmpty && p0.isEmpty) {
                              setState(() {
                                messageText = p0;
                              });
                            } else {
                              messageText = p0;
                            }
                            setSharedPrefsText();
                          }
                        },
                      )))
            ]))
      ]),
    );
  }
}
