// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$likesHash() => r'cb79a1370b60e0b4f0f18bb8aac6b0d5e7e4b88b';

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

abstract class _$Likes
    extends BuildlessAutoDisposeAsyncNotifier<List<PostLikeData>> {
  late final int postId;

  FutureOr<List<PostLikeData>> build(
    int postId,
  );
}

/// See also [Likes].
@ProviderFor(Likes)
const likesProvider = LikesFamily();

/// See also [Likes].
class LikesFamily extends Family<AsyncValue<List<PostLikeData>>> {
  /// See also [Likes].
  const LikesFamily();

  /// See also [Likes].
  LikesProvider call(
    int postId,
  ) {
    return LikesProvider(
      postId,
    );
  }

  @override
  LikesProvider getProviderOverride(
    covariant LikesProvider provider,
  ) {
    return call(
      provider.postId,
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
  String? get name => r'likesProvider';
}

/// See also [Likes].
class LikesProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Likes, List<PostLikeData>> {
  /// See also [Likes].
  LikesProvider(
    int postId,
  ) : this._internal(
          () => Likes()..postId = postId,
          from: likesProvider,
          name: r'likesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$likesHash,
          dependencies: LikesFamily._dependencies,
          allTransitiveDependencies: LikesFamily._allTransitiveDependencies,
          postId: postId,
        );

  LikesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final int postId;

  @override
  FutureOr<List<PostLikeData>> runNotifierBuild(
    covariant Likes notifier,
  ) {
    return notifier.build(
      postId,
    );
  }

  @override
  Override overrideWith(Likes Function() create) {
    return ProviderOverride(
      origin: this,
      override: LikesProvider._internal(
        () => create()..postId = postId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Likes, List<PostLikeData>>
      createElement() {
    return _LikesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LikesProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LikesRef on AutoDisposeAsyncNotifierProviderRef<List<PostLikeData>> {
  /// The parameter `postId` of this provider.
  int get postId;
}

class _LikesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Likes, List<PostLikeData>>
    with LikesRef {
  _LikesProviderElement(super.provider);

  @override
  int get postId => (origin as LikesProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
