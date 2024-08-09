import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/data/badge_data.dart';
import 'package:t4t/data/location_data.dart';
import 'package:t4t/data/profile_data.dart';
import 'package:t4t/extensions/color_extensions.dart';

part 'profile_provider.g.dart';

@riverpod
class Profile extends _$Profile {
  @override
  Future<ProfileData> build() async {
    final response = await Supabase.instance.client.from('profiles').select('''
    *,
    badges(
      badge_type:type_id(
        id,
        text, 
        color
      )
    )
  ''').eq('id', Supabase.instance.client.auth.currentSession!.user.id).single();

    return ProfileData.fromJson(response);
  }

  Future<void> updateSupporter(bool isSupporter) async {
    await future.then((value) {
      value = value.copyWith(supporter: isSupporter);
      state = AsyncData(value);
    });
  }

  Future<void> updateRace(String? race) async {
    await Supabase.instance.client
        .from('profiles')
        .update({'race': race?.trim().toLowerCase()}).eq(
            'id', Supabase.instance.client.auth.currentSession!.user.id);

    await future.then((value) {
      value = value.copyWith(race: race);
      state = AsyncData(value);
    });
  }

  Future<void> updateBio(String? bio) async {
    await Supabase.instance.client
        .from('profiles')
        .update({'bio': bio?.trim()}).eq(
            'id', Supabase.instance.client.auth.currentSession!.user.id);

    await future.then((value) {
      value = value.copyWith(bio: bio);
      state = AsyncData(value);
    });
  }

  Future<void> updateMessageNotif(bool show) async {
    await Supabase.instance.client
        .from('profiles')
        .update({'message_notif': show}).eq(
            'id', Supabase.instance.client.auth.currentSession!.user.id);

    await future.then((value) {
      value = value.copyWith(messageNotif: show);
      state = AsyncData(value);
    });
  }

  Future<void> updateLikeNotif(bool show) async {
    await Supabase.instance.client
        .from('profiles')
        .update({'like_notif': show}).eq(
            'id', Supabase.instance.client.auth.currentSession!.user.id);

    await future.then((value) {
      value = value.copyWith(likeNotif: show);
      state = AsyncData(value);
    });
  }

  Future<void> updateShowSupport(bool show) async {
    await Supabase.instance.client
        .from('profiles')
        .update({'show_supporter': show}).eq(
            'id', Supabase.instance.client.auth.currentSession!.user.id);

    await future.then((value) {
      value = value.copyWith(showSupporter: show);
      state = AsyncData(value);
    });
  }

  Future<void> updateUsername(String username) async {
    await Supabase.instance.client
        .from('profiles')
        .update({'username': username}).eq(
            'id', Supabase.instance.client.auth.currentSession!.user.id);

    await future.then((value) {
      value = value.copyWith(username: username);
      state = AsyncData(value);
    });
  }

  Future<void> updateColor(Color color) async {
    await Supabase.instance.client
        .from('profiles')
        .update({'color': color.toHex()}).eq(
            'id', Supabase.instance.client.auth.currentSession!.user.id);

    await future.then((value) {
      value = value.copyWith(color: color);
      state = AsyncData(value);
    });
  }

  Future<void> updateBadges(List<BadgeData> badgeList) async {
    await Supabase.instance.client.rpc('update_badges',
        params: {'badge_ids': badgeList.map((e) => e.id).toList()});

    await future.then((value) {
      value = value.copyWith(badges: badgeList);
      state = AsyncData(value);
    });
  }

  Future<void> updateLocation(LocationData location) async {
    await Supabase.instance.client.rpc('update_location', params: {
      'lat': location.position.latitude,
      'lon': location.position.longitude,
      'neighborhood_name': location.neighborhoodName,
      'city_name': location.cityName,
      'state_name': location.stateName,
      'country_name': location.countryName,
    });

    await future.then((value) {
      value = value.copyWith(
          neighborhood: location.neighborhoodName,
          city: location.cityName,
          state: location.stateName,
          country: location.countryName);
      state = AsyncData(value);
    });
  }

  Future<void> updatePronouns(String pronouns) async {
    await Supabase.instance.client
        .from('profiles')
        .update({'pronouns': pronouns.trim()}).eq(
            'id', Supabase.instance.client.auth.currentSession!.user.id);

    await future.then((value) {
      value = value.copyWith(pronouns: pronouns);
      state = AsyncData(value);
    });
  }

  Future<void> updateFCMToken(String fcmToken) async {
    await Supabase.instance.client
        .from('profiles')
        .update({'fcm_token': fcmToken}).eq(
            'id', Supabase.instance.client.auth.currentSession!.user.id);

    await future.then((value) {
      value = value.copyWith(fcmToken: fcmToken);
      state = AsyncData(value);
    });
  }

  Future<void> updateBirthdate(DateTime birthDate, bool showAstro) async {
    await Supabase.instance.client.from('profiles').update({
      'birthday': birthDate.toIso8601String(),
      'show_astro': showAstro
    }).eq('id', Supabase.instance.client.auth.currentSession!.user.id);

    await future.then((value) {
      value = value.copyWith(showAstro: showAstro, birthday: birthDate);

      state = AsyncData(value);
    });
  }

  Future<void> updatePublic(bool public) async {
    await Supabase.instance.client.from('profiles').update({
      'public': public,
    }).eq('id', Supabase.instance.client.auth.currentSession!.user.id);

    await future.then((value) {
      value = value.copyWith(public: public);

      state = AsyncData(value);
    });
  }
}
