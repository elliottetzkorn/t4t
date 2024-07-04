// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_sheet_posts_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileSheetPostsHash() => r'51f9a381d6e11083e42405810812b37102bfe320';

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

abstract class _$ProfileSheetPosts
    extends BuildlessAutoDisposeAsyncNotifier<List<ProfileSheetPostData>> {
  late final String profileId;
  late final bool authenticated;

  FutureOr<List<ProfileSheetPostData>> build(
    String profileId,
    bool authenticated,
  );
}

/// See also [ProfileSheetPosts].
@ProviderFor(ProfileSheetPosts)
const profileSheetPostsProvider = ProfileSheetPostsFamily();

/// See also [ProfileSheetPosts].
class ProfileSheetPostsFamily
    extends Family<AsyncValue<List<ProfileSheetPostData>>> {
  /// See also [ProfileSheetPosts].
  const ProfileSheetPostsFamily();

  /// See also [ProfileSheetPosts].
  ProfileSheetPostsProvider call(
    String profileId,
    bool authenticated,
  ) {
    return ProfileSheetPostsProvider(
      profileId,
      authenticated,
    );
  }

  @override
  ProfileSheetPostsProvider getProviderOverride(
    covariant ProfileSheetPostsProvider provider,
  ) {
    return call(
      provider.profileId,
      provider.authenticated,
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
  String? get name => r'profileSheetPostsProvider';
}

/// See also [ProfileSheetPosts].
class ProfileSheetPostsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ProfileSheetPosts, List<ProfileSheetPostData>> {
  /// See also [ProfileSheetPosts].
  ProfileSheetPostsProvider(
    String profileId,
    bool authenticated,
  ) : this._internal(
          () => ProfileSheetPosts()
            ..profileId = profileId
            ..authenticated = authenticated,
          from: profileSheetPostsProvider,
          name: r'profileSheetPostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$profileSheetPostsHash,
          dependencies: ProfileSheetPostsFamily._dependencies,
          allTransitiveDependencies:
              ProfileSheetPostsFamily._allTransitiveDependencies,
          profileId: profileId,
          authenticated: authenticated,
        );

  ProfileSheetPostsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.profileId,
    required this.authenticated,
  }) : super.internal();

  final String profileId;
  final bool authenticated;

  @override
  FutureOr<List<ProfileSheetPostData>> runNotifierBuild(
    covariant ProfileSheetPosts notifier,
  ) {
    return notifier.build(
      profileId,
      authenticated,
    );
  }

  @override
  Override overrideWith(ProfileSheetPosts Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProfileSheetPostsProvider._internal(
        () => create()
          ..profileId = profileId
          ..authenticated = authenticated,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        profileId: profileId,
        authenticated: authenticated,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProfileSheetPosts,
      List<ProfileSheetPostData>> createElement() {
    return _ProfileSheetPostsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileSheetPostsProvider &&
        other.profileId == profileId &&
        other.authenticated == authenticated;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, profileId.hashCode);
    hash = _SystemHash.combine(hash, authenticated.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProfileSheetPostsRef
    on AutoDisposeAsyncNotifierProviderRef<List<ProfileSheetPostData>> {
  /// The parameter `profileId` of this provider.
  String get profileId;

  /// The parameter `authenticated` of this provider.
  bool get authenticated;
}

class _ProfileSheetPostsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProfileSheetPosts,
        List<ProfileSheetPostData>> with ProfileSheetPostsRef {
  _ProfileSheetPostsProviderElement(super.provider);

  @override
  String get profileId => (origin as ProfileSheetPostsProvider).profileId;
  @override
  bool get authenticated => (origin as ProfileSheetPostsProvider).authenticated;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
