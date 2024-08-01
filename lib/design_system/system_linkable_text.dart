import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/enums/text_size_enum.dart';
import 'package:t4t/extensions/font_scale_extensions.dart';
import 'package:t4t/extensions/text_size_extensions.dart';
import 'package:t4t/providers/font_scale_provider.dart';
import 'package:t4t/providers/simple_font_provider.dart';
import 'package:t4t/utils/phone_linkifier.dart';
import 'package:url_launcher/url_launcher.dart';

class SystemLinkableText extends ConsumerWidget {
  const SystemLinkableText(
      {super.key,
      required this.text,
      this.size = TextSizeEnum.fifteen,
      this.color,
      this.maxLines,
      this.align = TextAlign.left,
      this.underline = false,
      this.light = false,
      this.overflow = TextOverflow.ellipsis});

  final String text;
  final TextSizeEnum size;
  final Color? color;

  final int? maxLines;
  final TextAlign align;
  final bool underline;
  final bool light;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontScale = ref.watch(fontScaleProvider);

    return Linkify(
        text: text,
        textAlign: align,
        maxLines: maxLines ?? 999,
        onOpen: (link) {
          HapticFeedback.selectionClick();
          launchUrl(Uri.parse(link.url));
        },
        linkifiers: const [
          EmailLinkifier(),
          UrlLinkifier(),
          PhoneNumberLinkifier()
        ],
        linkStyle: TextStyle(
            decoration: TextDecoration.underline,
            inherit: false,
            height: lineHeight,
            fontSize: size.toFontSize() * fontScale.toMultiple(),
            color: color ?? Theme.of(context).colorScheme.primary,
            fontFamily:
                ref.watch(simpleFontProvider) ? fontSimple : fontWaxWing,
            overflow: overflow),
        style: TextStyle(
            decoration: underline ? TextDecoration.underline : null,
            inherit: false,
            height: lineHeight,
            fontSize: size.toFontSize() * fontScale.toMultiple(),
            color: color ?? Theme.of(context).colorScheme.primary,
            fontFamily:
                ref.watch(simpleFontProvider) ? fontSimple : fontWaxWing,
            overflow: overflow));
  }
}
