import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t4t/data/badge_data.dart';
import 'package:t4t/data/like_type_data.dart';

const double goldenRatio =
    1.6180339887498948482045868343656381177203091798057628621354486227052604628189024497072;

const double spacingOne = 2.2;
const double spacingTwo = spacingOne * goldenRatio;
const double spacingThree = spacingTwo * goldenRatio;
const double spacingFour = spacingThree * goldenRatio;
const double spacingFive = spacingFour * goldenRatio;
const double spacingSix = spacingFive * goldenRatio;
const double spacingSeven = spacingSix * goldenRatio;
const double spacingEight = spacingSeven * goldenRatio;
const double spacingNine = spacingEight * goldenRatio;
const double spacingTen = spacingNine * goldenRatio;

const double inputRadius = spacingFour;

const double tapTarget = 48;

const double thinLine = 0.25;
const double line = thinLine * goldenRatio;

const int animationDuration = 200;
const int slowAnimationDuration = 400;

const double notifDimenSmall = 7;
const double notifDimenBig = 11;

const double elevatedButtonHeight = 52;

const Curve animationCurve = Curves.decelerate;

const double tabletWidth = 700;
const double feedRadius = spacingSix;

const double unselectedOpacity = 0.4;

const double lineHeight = 1.5;

const double buttonWidthPadding = 11;
const double buttonHeightPadding = 7;

const double smallX = 20;

const double maxPercentPost = 0.85;

const Color blackBackgroundColor = Color.fromRGBO(0, 0, 0, 1);
const Color blackInputBackgroundColorVariant = Color.fromRGBO(15, 15, 15, 1);
const Color blackInputBackgroundColor = Color.fromRGBO(36, 36, 36, 1);
const Color blackBackdrop = Color.fromRGBO(0, 0, 0, .5);
const Color blackGrey1 = Color.fromRGBO(238, 238, 238, 1);
const Color blackGrey2 = Color.fromRGBO(187, 187, 187, 1);
const Color blackGrey3 = Color.fromRGBO(136, 136, 136, 1);

const Color whiteBackgroundColor = Color.fromRGBO(255, 255, 255, 1);
const Color whiteInputBackgroundColor = Color.fromRGBO(242, 242, 242, 1);
const Color whiteBackdrop = Color.fromRGBO(0, 0, 0, .3);
const Color whiteGrey1 = Color.fromRGBO(17, 17, 17, 1);
const Color whiteGrey2 = Color.fromRGBO(85, 85, 85, 1);
const Color whiteGrey3 = Color.fromRGBO(153, 153, 153, 1);

const Color blueBackgroundColor = Color.fromRGBO(237, 237, 237, 1);
const Color blueInputBackgroundColor = Color.fromRGBO(213, 231, 248, 1);
const Color blueGrey1 = Color.fromRGBO(0, 102, 204, 1);
const Color blueGrey2 = Color.fromRGBO(71, 145, 219, 1);
const Color blueGrey3 = Color.fromRGBO(142, 188, 233, 1);

const Color redBackgroundColor = Color.fromRGBO(253, 242, 241, 1);
const Color redInputBackgroundColor = Color.fromRGBO(251, 224, 223, 1);
const Color redGrey1 = Color.fromRGBO(229, 8, 0, 1);
const Color redGrey2 = Color.fromRGBO(236, 78, 72, 1);
const Color redGrey3 = Color.fromRGBO(243, 148, 145, 1);

const Color brutalistBackgroundColor = Color.fromRGBO(187, 187, 187, 1);
const Color brutalistInputBackgroundColor = Color.fromRGBO(204, 204, 204, 1);
const Color brutalistGrey1 = Color.fromRGBO(0, 0, 0, 1);
const Color brutalistGrey2 = Color.fromRGBO(85, 85, 85, 1);
const Color brutalistGrey3 = Color.fromRGBO(119, 119, 119, 1);

const Color swissBackgroundColor = Color.fromRGBO(226, 83, 54, 1);
const Color swissInputBackgroundColor = Color.fromRGBO(230, 102, 77, 1);
const Color swissGrey1 = Color.fromRGBO(255, 255, 255, 1);
const Color swissGrey2 = Color.fromRGBO(246, 203, 195, 1);
const Color swissGrey3 = Color.fromRGBO(238, 152, 134, 1);

const Color kleinBackgroundColor = Color.fromRGBO(0, 47, 167, 1);
const Color kleinInputBackgroundColor = Color.fromRGBO(25, 68, 176, 1);
const Color kleinGrey1 = Color.fromRGBO(255, 255, 255, 1);
const Color kleinGrey2 = Color.fromRGBO(191, 203, 233, 1);
const Color kleinGrey3 = Color.fromRGBO(128, 151, 211, 1);

const Color pureBlue = Color.fromRGBO(0, 255, 0, 1);
const Color pureRed = Color.fromRGBO(255, 0, 0, 1);
const Color transBlue = Color(0xff5BCEFA);
const Color transPink = Color(0xffF5A9B8);

const double luminenceLowerBound = 0.2;
const double luminenceUpperBound = 0.333;

// Fonts
const String fontWaxWing = 'Waxwing';
const String fontSimple = 'DMSans';

const int appMinAge = 18;
const int appMaxAge = 100;

const int usernameLength = 14;

const int titleLength = 33;
const int bodyLength = 280;

const int bioLength = 140;

const int fetchQty = 66;

const int pollingTime = 5;
const int messagesPollingTime = 2;

const int badgeLimit = 8;

const int minDistanceKey = 1;
const int maxDistanceKey = 38;
const int minDistanceValue = 5;
const int maxDistanceValue = 999999;

const int postingTimeLimitMinutes = 10;

late String userId;

late SharedPreferences prefs;
const String prefsLastPostTime = 'shared_prefs_post_time';
const String prefsPremiumUpsellShowTime = 'shared_prefs_premium_time2';
const String prefsFilterDistance = 'shared_prefs_filter_distance_new';
const String prefsFilterMinAge = 'shared_prefs_filter_min_age';
const String prefsFilterMaxAge = 'shared_prefs_filter_max_age';
const String prefsFilterBadges = 'shared_prefs_filter_badges';
const String prefsFilterType = 'shared_prefs_filter_type';
const String prefsFilterWords = 'shared_prefs_filter_words';
const String prefsPostTitle = 'shared_prefs_post_title';
const String prefsPostBody = 'shared_prefs_post_body';
const String prefsPostType = 'shared_prefs_post_type2';
const String prefsMessage = 'shared_prefs_message';
const String prefsSettingsSimpleFont = 'shared_prefs_simple_font';
const String prefsSettingsLightTheme = 'shared_prefs_light_theme2';
const String prefsSettingsDarkTheme = 'shared_prefs_dark_theme2';
const String prefsSettingsMode = 'shared_prefs_mode';
const String prefsSetupSkipRace = 'setup_skip_race';
const String prefsSetupSkipBio = 'setup_skip_bio';
const String prefsSetupSkipLocation = 'setup_skip_location1';
const String prefsLastReactionId = 'shared_prefs_last_reaction_id';

const List<Color> transColors = [transPink, transBlue];

const String noState = 'none';

const String cacheWatercolor = 'cache_watercolor';
const double initialZoom = 15;

const List<BadgeData> availableBadges = [
  BadgeData(id: 20, text: 'ace', color: Color(0xffA3A3A3)),
  BadgeData(id: 45, text: 'androg', color: Color(0xff00B8E7)),
  BadgeData(id: 27, text: 'aro', color: Color(0xff7fbd04)),
  BadgeData(id: 21, text: 'bi', color: Color(0xffD60270)),
  BadgeData(id: 23, text: 'bipoc', color: Color(0xff72501e)),
  BadgeData(id: 22, text: 'butch', color: Color(0xffd82801)),
  BadgeData(id: 28, text: 'demi', color: Color(0xff228B22)),
  BadgeData(id: 39, text: 'disabled', color: Color(0xff585859)),
  BadgeData(id: 36, text: 'dyke', color: Color(0xff6e1bab)),
  BadgeData(id: 29, text: 'enby', color: Color(0xffFCF434)),
  BadgeData(id: 43, text: 'fag', color: Color(0xffe0115f)),
  BadgeData(id: 18, text: 'femme', color: Color(0xffF7E2DC)),
  BadgeData(id: 30, text: 'fluid', color: Color(0xff2F3CBE)),
  BadgeData(id: 16, text: 'ftm', color: Color(0xff5BCEFA)),
  BadgeData(id: 26, text: 'gay', color: Color(0xff078D70)),
  BadgeData(id: 32, text: 'hetero', color: Color(0xff000099)),
  BadgeData(id: 34, text: 'intersex', color: Color(0xff7902aa)),
  BadgeData(id: 31, text: 'lesbian', color: Color(0xffFF9A56)),
  BadgeData(id: 41, text: 'man', color: Color(0xff0000FF)),
  BadgeData(id: 17, text: 'masc', color: Color(0xff911002)),
  BadgeData(id: 44, text: 'monog', color: Color(0xffC0C0C0)),
  BadgeData(id: 15, text: 'mtf', color: Color(0xffF5A9B8)),
  BadgeData(id: 38, text: 'neuro', color: Color(0xffbbedbc)),
  BadgeData(id: 33, text: 'pan', color: Color(0xffffff00)),
  BadgeData(id: 24, text: 'poly', color: Color(0xff0000FF)),
  BadgeData(id: 19, text: 'queer', color: Color(0xffFFED00)),
  BadgeData(id: 25, text: 'sapphic', color: Color(0xffFBF2FF)),
  BadgeData(id: 48, text: 'stud', color: Color(0xff4085c6)),
  BadgeData(id: 46, text: 'system', color: Color(0xffDC143C)),
  BadgeData(id: 47, text: 'therian', color: Color(0xffff4f00)),
  BadgeData(id: 40, text: 'trans', color: Color(0xffafeeee)),
  BadgeData(id: 35, text: 'two-spirit', color: Color(0xffdeb887)),
  BadgeData(id: 42, text: 'woman', color: Color(0xff9F2B68)),
  BadgeData(id: 37, text: '???', color: Color(0xff008026)),
];

const List<LikeTypeData> likeTypes = [
  LikeTypeData(id: 1, text: '❤️'),
  LikeTypeData(id: 2, text: '😂'),
  LikeTypeData(id: 3, text: '😰'),
  LikeTypeData(id: 4, text: '🔥'),
  LikeTypeData(id: 5, text: '🚚'),
  LikeTypeData(id: 6, text: '🌹'),
  LikeTypeData(id: 8, text: '💯')
];

const List<int> postTypes = [0, 1, 3, 8, 4, 6, 2, 9, 5, 7];

const Map<int, int> valueToDistance = {
  minDistanceKey: minDistanceValue,
  2: 6,
  3: 7,
  4: 8,
  5: 9,
  6: 10,
  7: 11,
  8: 12,
  9: 13,
  10: 14,
  11: 15,
  12: 16,
  13: 17,
  14: 18,
  15: 19,
  16: 20,
  17: 21,
  18: 22,
  19: 23,
  20: 24,
  21: 25,
  22: 26,
  23: 27,
  24: 28,
  25: 29,
  26: 30,
  27: 40,
  28: 50,
  29: 60,
  30: 70,
  31: 80,
  32: 90,
  33: 100,
  34: 200,
  35: 300,
  36: 400,
  37: 500,
  maxDistanceKey: maxDistanceValue
};

const String locationFormatting = 'MMM dd, yyyy - h:mm a';

const List<String> globalCities = [
  'San Francisco',
  'New York',
  'Chicago',
  'Los Angeles',
  'London',
  'Paris',
  'Berlin'
];

const String usa = 'United States';

// Routes
const String routeHome = 'home';
const String routeBanned = 'banned';
const String routeSetupAge = 'setup_age';
const String routeSetupUsername = 'setup_username';
const String routeSetupPronouns = 'setup_pronouns';
const String routeSetupRace = 'setup_race';
const String routeSetupBio = 'setup_bio';
const String routeSetupBadges = 'setup_badges';
const String routeSetupLocation = 'setup_location';
const String routeSettings = 'settings';
const String routeSettingsApplication = 'settings_application';
const String routeSettingsDocuments = 'settings_documents';
const String routeSettingsAccount = 'settings_account';
const String routeSettingsSupporter = 'settings_supporter';
const String routeSettingsMod = 'mod_tools';
const String routeSettingsAccessibility = 'settings_accessibility';
const String routeSettingsNotifs = 'settings_notifs';
const String routeSettingsLicenses = 'settings_licenses';
const String routemMessages = 'messages_conversation';
