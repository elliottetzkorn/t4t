// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user_posts_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adminUserPostsHash() => r'ca396d73815096ff7592f5ce53cf8fbd418d10bc';

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

abstract class _$AdminUserPosts
    extends BuildlessAutoDisposeAsyncNotifier<List<PostData>> {
  late final String pid;

  FutureOr<List<PostData>> build(
    String pid,
  );
}

/// See also [AdminUserPosts].
@ProviderFor(AdminUserPosts)
const adminUserPostsProvider = AdminUserPostsFamily();

/// See also [AdminUserPosts].
class AdminUserPostsFamily extends Family<AsyncValue<List<PostData>>> {
  /// See also [AdminUserPosts].
  const AdminUserPostsFamily();

  /// See also [AdminUserPosts].
  AdminUserPostsProvider call(
    String pid,
  ) {
    return AdminUserPostsProvider(
      pid,
    );
  }

  @override
  AdminUserPostsProvider getProviderOverride(
    covariant AdminUserPostsProvider provider,
  ) {
    return call(
      provider.pid,
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
  String? get name => r'adminUserPostsProvider';
}

/// See also [AdminUserPosts].
class AdminUserPostsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AdminUserPosts, List<PostData>> {
  /// See also [AdminUserPosts].
  AdminUserPostsProvider(
    String pid,
  ) : this._internal(
          () => AdminUserPosts()..pid = pid,
          from: adminUserPostsProvider,
          name: r'adminUserPostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$adminUserPostsHash,
          dependencies: AdminUserPostsFamily._dependencies,
          allTransitiveDependencies:
              AdminUserPostsFamily._allTransitiveDependencies,
          pid: pid,
        );

  AdminUserPostsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pid,
  }) : super.internal();

  final String pid;

  @override
  FutureOr<List<PostData>> runNotifierBuild(
    covariant AdminUserPosts notifier,
  ) {
    return notifier.build(
      pid,
    );
  }

  @override
  Override overrideWith(AdminUserPosts Function() create) {
    return ProviderOverride(
      origin: this,
      override: AdminUserPostsProvider._internal(
        () => create()..pid = pid,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pid: pid,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AdminUserPosts, List<PostData>>
      createElement() {
    return _AdminUserPostsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdminUserPostsProvider && other.pid == pid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AdminUserPostsRef on AutoDisposeAsyncNotifierProviderRef<List<PostData>> {
  /// The parameter `pid` of this provider.
  String get pid;
}

class _AdminUserPostsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AdminUserPosts,
        List<PostData>> with AdminUserPostsRef {
  _AdminUserPostsProviderElement(super.provider);

  @override
  String get pid => (origin as AdminUserPostsProvider).pid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
