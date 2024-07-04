import 'package:flutter/material.dart';
import 'package:t4t/constants.dart';
import 'package:t4t/enums/color_theme_enum.dart';

class ThemeUtils {
  ThemeUtils._();

  static ThemeData whiteTheme =
      themeForThemeEnum(Brightness.light, ColorThemeEnum.white);
  static ThemeData blackTheme =
      themeForThemeEnum(Brightness.dark, ColorThemeEnum.black);
  static ThemeData blueTheme =
      themeForThemeEnum(Brightness.light, ColorThemeEnum.blue);
  static ThemeData redTheme =
      themeForThemeEnum(Brightness.light, ColorThemeEnum.red);
  static ThemeData brutalistTheme =
      themeForThemeEnum(Brightness.light, ColorThemeEnum.brutalist);
  static ThemeData kleinTheme =
      themeForThemeEnum(Brightness.dark, ColorThemeEnum.klein);

  static ThemeData themeForThemeEnum(
      Brightness brightness, ColorThemeEnum themeEnum) {
    return ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        brightness: brightness,
        scaffoldBackgroundColor: background(themeEnum),
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: primary(themeEnum),
          onPrimary: onPrimary(themeEnum),
          secondary: secondary(themeEnum),
          onSecondary: onSecondary(themeEnum),
          error: error(themeEnum),
          onError: onError(themeEnum),
          surface: surface(themeEnum),
          onSurface: onSurface(themeEnum),
          primaryContainer: primaryContainer(themeEnum),
          onPrimaryContainer: onPrimaryContainer(themeEnum),
          secondaryContainer: secondaryContainer(themeEnum),
          onSecondaryContainer: onSecondaryContainer(themeEnum),
          tertiary: tertiary(themeEnum),
          onTertiary: onTertiary(themeEnum),
          tertiaryContainer: tertiaryContainer(themeEnum),
          onTertiaryContainer: onTertiaryContainer(themeEnum),
          errorContainer: errorContainer(themeEnum),
          onErrorContainer: onErrorContainer(themeEnum),
          surfaceContainerHighest: surfaceVariant(themeEnum),
          onSurfaceVariant: onSurfaceVariant(themeEnum),
          outline: outline(themeEnum),
          outlineVariant: outlineVariant(themeEnum),
          shadow: shadow(themeEnum),
          scrim: scrim(themeEnum),
          inverseSurface: inverseSurface(themeEnum),
          onInverseSurface: onInverseSurface(themeEnum),
          inversePrimary: inversePrimary(themeEnum),
          surfaceTint: surfaceTint(themeEnum),
        ),
        fontFamily: fontWaxWing);
  }

  static Color primary(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey1;
      case ColorThemeEnum.blue:
        return blueGrey1;
      case ColorThemeEnum.red:
        return redGrey1;
      case ColorThemeEnum.brutalist:
        return brutalistGrey1;
      case ColorThemeEnum.klein:
        return kleinGrey1;
      case ColorThemeEnum.white:
      default:
        return whiteGrey1;
    }
  }

  static Color onPrimary(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackBackgroundColor;
      case ColorThemeEnum.blue:
        return blueBackgroundColor;
      case ColorThemeEnum.red:
        return redBackgroundColor;
      case ColorThemeEnum.brutalist:
        return brutalistBackgroundColor;
      case ColorThemeEnum.klein:
        return kleinBackgroundColor;
      case ColorThemeEnum.white:
      default:
        return whiteBackgroundColor;
    }
  }

  static Color secondary(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey2;
      case ColorThemeEnum.blue:
        return blueGrey2;
      case ColorThemeEnum.red:
        return redGrey2;
      case ColorThemeEnum.brutalist:
        return brutalistGrey2;
      case ColorThemeEnum.klein:
        return kleinGrey2;
      case ColorThemeEnum.white:
      default:
        return whiteGrey2;
    }
  }

  static Color onSecondary(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackBackgroundColor;
      case ColorThemeEnum.blue:
        return blueBackgroundColor;
      case ColorThemeEnum.red:
        return redBackgroundColor;
      case ColorThemeEnum.brutalist:
        return brutalistBackgroundColor;
      case ColorThemeEnum.klein:
        return kleinBackgroundColor;
      case ColorThemeEnum.white:
      default:
        return whiteBackgroundColor;
    }
  }

  static Color error(ColorThemeEnum themeEnum) {
    return pureRed;
  }

  static Color onError(ColorThemeEnum themeEnum) {
    return Colors.white;
  }

  static Color background(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackBackgroundColor;
      case ColorThemeEnum.blue:
        return blueBackgroundColor;
      case ColorThemeEnum.red:
        return redBackgroundColor;
      case ColorThemeEnum.brutalist:
        return brutalistBackgroundColor;
      case ColorThemeEnum.klein:
        return kleinBackgroundColor;
      case ColorThemeEnum.white:
      default:
        return whiteBackgroundColor;
    }
  }

  static Color surface(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackInputBackgroundColor;
      case ColorThemeEnum.blue:
        return blueInputBackgroundColor;
      case ColorThemeEnum.red:
        return redInputBackgroundColor;
      case ColorThemeEnum.brutalist:
        return brutalistInputBackgroundColor;
      case ColorThemeEnum.klein:
        return kleinInputBackgroundColor;
      case ColorThemeEnum.white:
      default:
        return whiteInputBackgroundColor;
    }
  }

  static Color onSurface(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey1;
      case ColorThemeEnum.blue:
        return blueGrey1;
      case ColorThemeEnum.red:
        return redGrey1;
      case ColorThemeEnum.brutalist:
        return brutalistGrey1;
      case ColorThemeEnum.klein:
        return kleinGrey1;
      case ColorThemeEnum.white:
      default:
        return whiteGrey1;
    }
  }

  static Color primaryContainer(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackInputBackgroundColor;
      case ColorThemeEnum.blue:
        return blueInputBackgroundColor;
      case ColorThemeEnum.red:
        return redInputBackgroundColor;
      case ColorThemeEnum.brutalist:
        return brutalistInputBackgroundColor;
      case ColorThemeEnum.klein:
        return kleinInputBackgroundColor;
      case ColorThemeEnum.white:
      default:
        return whiteInputBackgroundColor;
    }
  }

  static Color onPrimaryContainer(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey1;
      case ColorThemeEnum.blue:
        return blueGrey1;
      case ColorThemeEnum.red:
        return redGrey1;
      case ColorThemeEnum.brutalist:
        return brutalistGrey1;
      case ColorThemeEnum.klein:
        return kleinGrey1;
      case ColorThemeEnum.white:
      default:
        return whiteGrey1;
    }
  }

  static Color secondaryContainer(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey1;
      case ColorThemeEnum.blue:
        return blueGrey1;
      case ColorThemeEnum.red:
        return redGrey1;
      case ColorThemeEnum.brutalist:
        return brutalistGrey1;
      case ColorThemeEnum.klein:
        return kleinGrey1;
      case ColorThemeEnum.white:
      default:
        return whiteGrey1;
    }
  }

  static Color onSecondaryContainer(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey1;
      case ColorThemeEnum.blue:
        return blueGrey1;
      case ColorThemeEnum.red:
        return redGrey1;
      case ColorThemeEnum.brutalist:
        return brutalistGrey1;
      case ColorThemeEnum.klein:
        return kleinGrey1;
      case ColorThemeEnum.white:
      default:
        return whiteGrey1;
    }
  }

  static Color tertiary(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey3;
      case ColorThemeEnum.blue:
        return blueGrey3;
      case ColorThemeEnum.red:
        return redGrey3;
      case ColorThemeEnum.brutalist:
        return brutalistGrey3;
      case ColorThemeEnum.klein:
        return kleinGrey3;
      case ColorThemeEnum.white:
      default:
        return whiteGrey3;
    }
  }

  static Color onTertiary(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackBackgroundColor;
      case ColorThemeEnum.blue:
        return blueBackgroundColor;
      case ColorThemeEnum.red:
        return redBackgroundColor;
      case ColorThemeEnum.brutalist:
        return brutalistBackgroundColor;
      case ColorThemeEnum.klein:
        return kleinBackgroundColor;
      case ColorThemeEnum.white:
      default:
        return whiteBackgroundColor;
    }
  }

  static Color tertiaryContainer(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey1;
      case ColorThemeEnum.blue:
        return blueGrey1;
      case ColorThemeEnum.red:
        return redGrey1;
      case ColorThemeEnum.brutalist:
        return brutalistGrey1;
      case ColorThemeEnum.klein:
        return kleinGrey1;
      case ColorThemeEnum.white:
      default:
        return whiteGrey1;
    }
  }

  static Color onTertiaryContainer(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey1;
      case ColorThemeEnum.blue:
        return blueGrey1;
      case ColorThemeEnum.red:
        return redGrey1;
      case ColorThemeEnum.brutalist:
        return brutalistGrey1;
      case ColorThemeEnum.klein:
        return kleinGrey1;
      case ColorThemeEnum.white:
      default:
        return whiteGrey1;
    }
  }

  static Color errorContainer(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey1;
      case ColorThemeEnum.blue:
        return blueGrey1;
      case ColorThemeEnum.red:
        return redGrey1;
      case ColorThemeEnum.brutalist:
        return brutalistGrey1;
      case ColorThemeEnum.klein:
        return kleinGrey1;
      case ColorThemeEnum.white:
      default:
        return whiteGrey1;
    }
  }

  static Color onErrorContainer(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey1;
      case ColorThemeEnum.blue:
        return blueGrey1;
      case ColorThemeEnum.red:
        return redGrey1;
      case ColorThemeEnum.brutalist:
        return brutalistGrey1;
      case ColorThemeEnum.klein:
        return kleinGrey1;
      case ColorThemeEnum.white:
      default:
        return whiteGrey1;
    }
  }

  static Color surfaceVariant(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackInputBackgroundColorVariant;
      case ColorThemeEnum.blue:
        return blueBackgroundColor;
      case ColorThemeEnum.red:
        return redBackgroundColor;
      case ColorThemeEnum.brutalist:
        return brutalistBackgroundColor;
      case ColorThemeEnum.klein:
        return kleinBackgroundColor;
      case ColorThemeEnum.white:
      default:
        return whiteBackgroundColor;
    }
  }

  static Color onSurfaceVariant(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey1;
      case ColorThemeEnum.blue:
        return blueGrey1;
      case ColorThemeEnum.red:
        return redGrey1;
      case ColorThemeEnum.brutalist:
        return brutalistGrey1;
      case ColorThemeEnum.klein:
        return kleinGrey1;
      case ColorThemeEnum.white:
      default:
        return whiteGrey1;
    }
  }

  static Color outline(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey1;
      case ColorThemeEnum.blue:
        return blueGrey1;
      case ColorThemeEnum.red:
        return redGrey1;
      case ColorThemeEnum.brutalist:
        return brutalistGrey1;
      case ColorThemeEnum.klein:
        return kleinGrey1;
      case ColorThemeEnum.white:
      default:
        return whiteGrey1;
    }
  }

  static Color outlineVariant(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey1;
      case ColorThemeEnum.blue:
        return blueGrey1;
      case ColorThemeEnum.red:
        return redGrey1;
      case ColorThemeEnum.brutalist:
        return brutalistGrey1;
      case ColorThemeEnum.klein:
        return kleinGrey1;
      case ColorThemeEnum.white:
      default:
        return whiteGrey1;
    }
  }

  static Color shadow(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackBackdrop;
      case ColorThemeEnum.blue:
        return whiteBackdrop;
      case ColorThemeEnum.red:
        return whiteBackdrop;
      case ColorThemeEnum.brutalist:
        return whiteBackdrop;
      case ColorThemeEnum.klein:
        return whiteBackdrop;
      case ColorThemeEnum.white:
      default:
        return whiteBackdrop;
    }
  }

  static Color scrim(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey1;
      case ColorThemeEnum.blue:
        return blueGrey1;
      case ColorThemeEnum.red:
        return redGrey1;
      case ColorThemeEnum.brutalist:
        return brutalistGrey1;
      case ColorThemeEnum.klein:
        return kleinGrey1;
      case ColorThemeEnum.white:
      default:
        return whiteGrey1;
    }
  }

  static Color inverseSurface(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey1;
      case ColorThemeEnum.blue:
        return blueGrey1;
      case ColorThemeEnum.red:
        return redGrey1;
      case ColorThemeEnum.brutalist:
        return brutalistGrey1;
      case ColorThemeEnum.klein:
        return kleinGrey1;
      case ColorThemeEnum.white:
      default:
        return whiteGrey1;
    }
  }

  static Color onInverseSurface(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey1;
      case ColorThemeEnum.blue:
        return blueGrey1;
      case ColorThemeEnum.red:
        return redGrey1;
      case ColorThemeEnum.brutalist:
        return brutalistGrey1;
      case ColorThemeEnum.klein:
        return kleinGrey1;
      case ColorThemeEnum.white:
      default:
        return whiteGrey1;
    }
  }

  static Color inversePrimary(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey1;
      case ColorThemeEnum.blue:
        return blueGrey1;
      case ColorThemeEnum.red:
        return redGrey1;
      case ColorThemeEnum.brutalist:
        return brutalistGrey1;
      case ColorThemeEnum.klein:
        return kleinGrey1;
      case ColorThemeEnum.white:
      default:
        return whiteGrey1;
    }
  }

  static Color surfaceTint(ColorThemeEnum themeEnum) {
    switch (themeEnum) {
      case ColorThemeEnum.black:
        return blackGrey1;
      case ColorThemeEnum.blue:
        return blueGrey1;
      case ColorThemeEnum.red:
        return redGrey1;
      case ColorThemeEnum.brutalist:
        return brutalistGrey1;
      case ColorThemeEnum.klein:
        return kleinGrey1;
      case ColorThemeEnum.white:
      default:
        return whiteGrey1;
    }
  }
}
