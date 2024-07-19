import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:google_places_autocomplete_text_field/model/prediction.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/components/date_selector.dart';
import 'package:t4t/components/limited_length_text_form_field.dart';
import 'package:t4t/components/post_type_selector.dart';
import 'package:t4t/components/system_tap.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/data/post_data.dart';
import 'package:t4t/design_system/system_action_page.dart';
import 'package:t4t/design_system/system_button.dart';
import 'package:t4t/design_system/system_loader.dart';
import 'package:t4t/design_system/system_sheet.dart';
import 'package:t4t/design_system/system_text.dart';
import 'package:t4t/design_system/system_text_button.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/extensions/text_size_extensions.dart';
import 'package:t4t/providers/notifications_provider.dart';
import 'package:t4t/providers/posts_authenticated_provider.dart';
import 'package:t4t/providers/profile_posts_provider.dart';
import 'package:t4t/providers/simple_font_provider.dart';
import 'package:t4t/utils/network_utils.dart';
import 'package:t4t/utils/post_time.dart';

class NewPostPage extends ConsumerStatefulWidget {
  const NewPostPage({super.key, this.post});

  final PostData? post;

  @override
  ConsumerState<NewPostPage> createState() => _SetupPronounsPageState();
}

class _SetupPronounsPageState extends ConsumerState<NewPostPage> {
  late ScrollController scrollController;
  String hint = '';
  String prompt = '';
  late String title;
  late String body;
  int newPostType = 0;
  bool _titleShortEnough = false;
  bool _bodyShortEnough = false;
  DateTime? date;
  Prediction? prediction;
  bool posting = false;
  bool loadingLocation = false;
  bool titleChanged = false;
  bool bodyChanged = false;
  bool loading = true;
  TextEditingController locationTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    setInitialValues();

    scrollController = ScrollController();
  }

  void resetPrefs() {
    prefs.setString(
        prefsPostTitle + Supabase.instance.client.auth.currentSession!.user.id,
        '');
    prefs.setString(
        prefsPostBody + Supabase.instance.client.auth.currentSession!.user.id,
        '');
    prefs.setInt(
        prefsPostType + Supabase.instance.client.auth.currentSession!.user.id,
        0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    hint = [
      AppLocalizations.of(context)!.post_sheet_room_submit_title_subtitle_air,
      AppLocalizations.of(context)!.post_sheet_room_submit_title_subtitle_water,
      AppLocalizations.of(context)!.post_sheet_room_submit_title_subtitle_earth,
      AppLocalizations.of(context)!.post_sheet_room_submit_title_subtitle_fire
    ][Random().nextInt(4)];

    List<String> prompts = [
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_1,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_2,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_3,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_4,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_5,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_6,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_7,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_8,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_9,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_10,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_11,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_12,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_13,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_14,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_15,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_16,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_17,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_18,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_19,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_20,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_21,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_22,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_23,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_24,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_25,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_26,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_27,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_28,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_29,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_30,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_31,
      AppLocalizations.of(context)!.post_sheet_room_submit_body_subtitle_32
    ];

    prompts.shuffle();
    prompts.take(4).forEach((element) {
      prompt += '$element ';
    });
  }

  Future<void> setInitialValues() async {
    if (widget.post == null) {
      setState(() {
        title = prefs.getString(prefsPostTitle +
                Supabase.instance.client.auth.currentSession!.user.id) ??
            '';
        body = prefs.getString(prefsPostBody +
                Supabase.instance.client.auth.currentSession!.user.id) ??
            '';
        newPostType = prefs.getInt(prefsPostType +
                Supabase.instance.client.auth.currentSession!.user.id) ??
            0;

        if (title.isNotEmpty) {
          _titleShortEnough = true;
        }

        if (body.isNotEmpty) {
          _bodyShortEnough = true;
        }

        loading = false;
      });
    } else {
      setState(() {
        title = widget.post!.title;
        body = widget.post!.body;
        newPostType = widget.post!.postTypeId;
        if (newPostType == 3) {
          prediction = Prediction(
              description: widget.post!.event!.location,
              lat: widget.post!.lat?.toString(),
              lng: widget.post!.lon?.toString());
          locationTextController.text = widget.post!.event!.location ?? '';
          date = widget.post!.event!.startDate;
        }
      });

      loading = false;
    }
  }

  Future<void> createPost() async {
    return NetworkUtils.safeNetworkCall(context, () {
      return Supabase.instance.client
          .from('posts')
          .insert({
            'profile_id': Supabase.instance.client.auth.currentSession!.user.id,
            'title': title.trim(),
            'body': body.trim(),
            'post_type_id': newPostType,
            'date': date?.toIso8601String(),
            'timezone': date?.timeZoneName,
            'address': prediction?.description,
            'lat': prediction?.lat,
            'lon': prediction?.lng,
            'location': prediction != null
                ? 'POINT(${prediction!.lng} ${prediction!.lat})'
                : null,
          })
          .select('*')
          .single();
    }, (value) {
      HapticFeedback.vibrate();

      ref.read(postsAuthenticatedProvider.notifier).poll(true);
      PostTime.setLastPostTime();

      resetPrefs();

      context.pop();
    }, () {
      setState(() {
        posting = false;
      });
    }, false);
  }

  Future<void> updatePost() async {
    return NetworkUtils.safeNetworkCall(context, () {
      return Supabase.instance.client
          .from('posts')
          .update({
            'title': title.trim(),
            'body': body.trim(),
            'post_type_id': newPostType,
            'date': date?.toIso8601String(),
            'timezone': date?.timeZoneName,
            'address': prediction?.description,
            'lat': prediction?.lat,
            'lon': prediction?.lng,
            'location': prediction != null
                ? 'POINT(${prediction!.lng} ${prediction!.lat})'
                : null,
          })
          .eq('id', widget.post!.id)
          .select('*')
          .single();
    }, (value) {
      HapticFeedback.vibrate();

      PostData newPost = PostData.fromMap(value);

      ref.read(postsAuthenticatedProvider.notifier).updatePost(newPost);
      ref.read(profilePostsProvider.notifier).updatePost(newPost);
      ref
          .read(notificationsProvider.notifier)
          .changeTitle(widget.post!.id, title);

      context.pop();
    }, () {
      setState(() {
        posting = false;
      });
    }, false);
  }

  bool readyToSave() {
    if (newPostType == 3) {
      return _titleShortEnough &&
          _bodyShortEnough &&
          newPostType != 0 &&
          date != null &&
          prediction != null;
    } else {
      return _titleShortEnough && _bodyShortEnough && newPostType != 0;
    }
  }

  bool scrollDownRequired() {
    if (newPostType == 3 && _titleShortEnough && _bodyShortEnough) {
      return date == null || prediction == null;
    } else {
      return newPostType == 0 && _titleShortEnough && _bodyShortEnough;
    }
  }

  bool readyToUpdate() {
    if (newPostType == 3) {
      return (_titleShortEnough && title != widget.post!.title) ||
          (_bodyShortEnough && body != widget.post!.body) ||
          (newPostType != widget.post!.postTypeId) ||
          (prediction != null &&
              prediction!.description != widget.post!.event?.title) ||
          (date != null && date != widget.post!.event?.startDate);
    } else {
      return (_titleShortEnough && title != widget.post!.title) ||
          (_bodyShortEnough && body != widget.post!.body) ||
          (newPostType != widget.post!.postTypeId);
    }
  }

  void dateTimeChanged(DateTime newDate) {
    setState(() {
      date = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SystemActionPage(
        scrollController: scrollController,
        body: loading
            ? const SystemLoader()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LimitedLengthTextFormField(
                    extraFocusedEmphasis: true,
                    autoFocus: true,
                    continueAction: TextInputAction.next,
                    highContrast: true,
                    title: AppLocalizations.of(context)!
                        .post_sheet_room_submit_title_title,
                    hint: hint,
                    text: title,
                    maxChars: titleLength,
                    handleCaptionChanged: (p0, p1, p2) {
                      if (p0 != null) {
                        setState(() {
                          title = p0;
                          _titleShortEnough = p2;
                        });

                        if (widget.post == null) {
                          prefs.setString(
                              prefsPostTitle +
                                  Supabase.instance.client.auth.currentSession!
                                      .user.id,
                              p0);
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: spacingSix,
                  ),
                  LimitedLengthTextFormField(
                    extraFocusedEmphasis: true,
                    continueAction: TextInputAction.newline,
                    lines: 4,
                    autoFocus: true,
                    highContrast: true,
                    onSubmitted: (p0) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    title: AppLocalizations.of(context)!
                        .post_sheet_room_submit_body_title,
                    hint: prompt,
                    text: body,
                    maxChars: bodyLength,
                    handleCaptionChanged: (p0, p1, p2) {
                      if (p0 != null) {
                        setState(() {
                          body = p0;
                          _bodyShortEnough = p2;
                        });

                        if (widget.post == null) {
                          prefs.setString(
                              prefsPostBody +
                                  Supabase.instance.client.auth.currentSession!
                                      .user.id,
                              p0);
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: spacingSix,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: SystemText(
                        text: AppLocalizations.of(context)!.posts_type_title,
                        size: TextSizeEnum.eighteen,
                      )),
                  const SizedBox(
                    height: spacingFive,
                  ),
                  PostTypeSelector(
                      editPost: true,
                      onTapped: (int filterTapped) {
                        if (newPostType != filterTapped) {
                          setState(() {
                            newPostType = filterTapped;
                          });

                          if (widget.post == null) {
                            prefs.setInt(
                                prefsPostType +
                                    Supabase.instance.client.auth
                                        .currentSession!.user.id,
                                newPostType);
                          }

                          scrollController.animateTo(
                              scrollController.position.maxScrollExtent,
                              duration: const Duration(
                                  milliseconds: animationDuration),
                              curve: animationCurve);
                        }
                      },
                      currentCell: newPostType),
                  if (newPostType == 3)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: spacingSix,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: SystemText(
                              text: AppLocalizations.of(context)!
                                  .posts_location_title,
                              size: TextSizeEnum.eighteen,
                            )),
                        const SizedBox(height: spacingFive),
                        GooglePlacesAutoCompleteTextFormField(
                            autofocus: true,
                            decoration: InputDecoration(
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: thinLine,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                                  borderRadius:
                                      BorderRadius.circular(inputRadius),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(inputRadius),
                                  borderSide: BorderSide(
                                      width: line,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(inputRadius),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                          Theme.of(context).colorScheme.error),
                                ),
                                hintStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                fillColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                hintText: AppLocalizations.of(context)!
                                    .post_sheet_location_hint),
                            style: TextStyle(
                                fontFamily: ref.watch(simpleFontProvider)
                                    ? fontSimple
                                    : fontWaxWing,
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: TextSizeEnum.fifteen.toFontSize()),
                            textEditingController: locationTextController,
                            googleAPIKey: dotenv.env['MAPS_API_KEY']!,
                            isLatLngRequired: true,
                            itmClick: (newPrediction) {
                              setState(() {
                                prediction = newPrediction;

                                if (prediction != null &&
                                    prediction!.description != null) {
                                  locationTextController.text =
                                      prediction!.description!;
                                }
                              });
                            }),
                        const SizedBox(
                          height: spacingSix,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: SystemText(
                              text: AppLocalizations.of(context)!
                                  .posts_time_title,
                              size: TextSizeEnum.eighteen,
                            )),
                        const SizedBox(height: spacingFive),
                        SystemTap(
                            onTap: () {
                              SystemSheet.show(
                                  context: context,
                                  child: DateSelector(
                                      postDate: date == null
                                          ? DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              DateTime.now().day,
                                              DateTime.now().hour)
                                          : date!,
                                      dateChanged: dateTimeChanged));
                            },
                            child: Container(
                                height: tapTarget,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: buttonWidthPadding,
                                ),
                                decoration: BoxDecoration(
                                    color: date == null
                                        ? Theme.of(context)
                                            .scaffoldBackgroundColor
                                        : Theme.of(context).colorScheme.primary,
                                    borderRadius:
                                        BorderRadius.circular(inputRadius)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SystemText(
                                          color: date == null
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .secondary
                                              : Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                          text: date == null
                                              ? AppLocalizations.of(context)!
                                                  .select_time
                                              : DateFormat(locationFormatting)
                                                  .format(date!))
                                    ]))),
                      ],
                    ),
                ],
              ),
        action: Column(mainAxisSize: MainAxisSize.min, children: [
          if (scrollDownRequired())
            Column(mainAxisSize: MainAxisSize.min, children: [
              SystemTextButton(
                text: AppLocalizations.of(context)!.scroll_down_type,
                onPressed: () {
                  scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: animationDuration),
                      curve: animationCurve);
                },
              ),
              const SizedBox(height: spacingFour)
            ]),
          widget.post == null
              ? PostTime.canPost()
                  ? SystemButton(
                      moreImpactful: true,
                      text: posting
                          ? AppLocalizations.of(context)!
                              .post_sheet_room_submit_posting
                          : AppLocalizations.of(context)!
                              .post_sheet_room_submit_post,
                      enabled: readyToSave(),
                      onPressed: () {
                        setState(() {
                          posting = true;
                        });

                        createPost();
                      })
                  : TweenAnimationBuilder<Duration>(
                      duration: Duration(
                          seconds: (postingTimeLimitMinutes * 60) -
                              PostTime.timeSinceLastPostFromSelf().inSeconds),
                      tween: Tween(
                          begin: Duration(
                              seconds: (postingTimeLimitMinutes * 60) -
                                  PostTime.timeSinceLastPostFromSelf()
                                      .inSeconds),
                          end: Duration.zero),
                      builder: (BuildContext context, Duration value,
                          Widget? child) {
                        final minutes = value.inMinutes;
                        final seconds = value.inSeconds % 60;

                        return SystemButton(
                            moreImpactful: true,
                            text: value.inSeconds == 0
                                ? posting
                                    ? AppLocalizations.of(context)!
                                        .post_sheet_room_submit_posting
                                    : AppLocalizations.of(context)!
                                        .post_sheet_room_submit_post
                                : "${AppLocalizations.of(context)!.wait} ${minutes == 0 ? '' : "${minutes}m"} ${seconds}s",
                            enabled: value.inSeconds == 0 && readyToSave(),
                            onPressed: () {
                              setState(() {
                                posting = true;
                              });

                              createPost();
                            });
                      })
              : SystemButton(
                  moreImpactful: true,
                  text: posting
                      ? AppLocalizations.of(context)!
                          .post_sheet_room_update_posting
                      : AppLocalizations.of(context)!
                          .post_sheet_room_update_post,
                  enabled: readyToUpdate(),
                  onPressed: () {
                    setState(() {
                      posting = true;
                    });

                    updatePost();
                  }),
        ]));
  }
}
