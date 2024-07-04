import 'package:t4t/constants.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/data/profile_min_data.dart';

extension BooleanParsing on ProfileData {
  ProfileMinData min() {
    if (usernameIncomplete()) {
      return ProfileMinData(id: id, supporter: supporter, color: color);
    } else {
      return ProfileMinData(
          id: id, supporter: supporter, color: color, username: username!);
    }
  }

  bool incomplete() {
    return ageIncomplete() ||
        usernameIncomplete() ||
        pronounsIncomplete() ||
        badgesIncomplete() ||
        raceIncomplete() ||
        bioIncomplete() ||
        locationIncomplete();
  }

  bool ageIncomplete() {
    return birthday == null;
  }

  bool usernameIncomplete() {
    return username == null || username!.isEmpty;
  }

  bool pronounsIncomplete() {
    return pronouns == null || pronouns!.isEmpty;
  }

  bool badgesIncomplete() {
    return badges == null || badges!.isEmpty;
  }

  bool raceIncomplete() {
    return (race == null || race!.isEmpty) &&
        prefs.getBool(
              prefsSetupSkipRace + id,
            ) !=
            true;
  }

  bool bioIncomplete() {
    return (bio == null || bio!.isEmpty) &&
        prefs.getBool(prefsSetupSkipBio + id) != true;
  }

  bool locationIncomplete() {
    return (neighborhood == null || state == null) &&
        prefs.getBool(prefsSetupSkipLocation + id) != true;
  }
}
