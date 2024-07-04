// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_sheet_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileSheetProfileHash() =>
    r'197fe304542c5771ad0aa91963d58972da4361ff';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [profileSheetProfile].
@ProviderFor(profileSheetProfile)
const profileSheetProfileProvider = ProfileSheetProfileFamily();

/// See also [profileSheetProfile].
class ProfileSheetProfileFamily extends Family<AsyncValue<ProfileData>> {
  /// See also [profileSheetProfile].
  const ProfileSheetProfileFamily();

  /// See also [profileSheetProfile].
  ProfileSheetProfileProvider call(
    String profileId,
  ) {
    return ProfileSheetProfileProvider(
      profileId,
    );
  }

  @override
  ProfileSheetProfileProvider getProviderOverride(
    covariant ProfileSheetProfileProvider provider,
  ) {
    return call(
      provider.profileId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'profileSheetProfileProvider';
}

/// See also [profileSheetProfile].
class ProfileSheetProfileProvider
    extends AutoDisposeFutureProvider<ProfileData> {
  /// See also [profileSheetProfile].
  ProfileSheetProfileProvider(
    String profileId,
  ) : this._internal(
          (ref) => profileSheetProfile(
            ref as ProfileSheetProfileRef,
            profileId,
          ),
          from: profileSheetProfileProvider,
          name: r'profileSheetProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$profileSheetProfileHash,
          dependencies: ProfileSheetProfileFamily._dependencies,
          allTransitiveDependencies:
              ProfileSheetProfileFamily._allTransitiveDependencies,
          profileId: profileId,
        );

  ProfileSheetProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.profileId,
  }) : super.internal();

  final String profileId;

  @override
  Override overrideWith(
    FutureOr<ProfileData> Function(ProfileSheetProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProfileSheetProfileProvider._internal(
        (ref) => create(ref as ProfileSheetProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        profileId: profileId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ProfileData> createElement() {
    return _ProfileSheetProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileSheetProfileProvider && other.profileId == profileId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, profileId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProfileSheetProfileRef on AutoDisposeFutureProviderRef<ProfileData> {
  /// The parameter `profileId` of this provider.
  String get profileId;
}

class _ProfileSheetProfileProviderElement
    extends AutoDisposeFutureProviderElement<ProfileData>
    with ProfileSheetProfileRef {
  _ProfileSheetProfileProviderElement(super.provider);

  @override
  String get profileId => (origin as ProfileSheetProfileProvider).profileId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
