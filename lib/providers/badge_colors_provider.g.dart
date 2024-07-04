// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_colors_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$badgeColorsHash() => r'6b568a8e546668a922d5e9f6c9ef95df666422a9';

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

/// See also [badgeColors].
@ProviderFor(badgeColors)
const badgeColorsProvider = BadgeColorsFamily();

/// See also [badgeColors].
class BadgeColorsFamily extends Family<AsyncValue<List<Color>>> {
  /// See also [badgeColors].
  const BadgeColorsFamily();

  /// See also [badgeColors].
  BadgeColorsProvider call(
    SubPagesEnum page,
  ) {
    return BadgeColorsProvider(
      page,
    );
  }

  @override
  BadgeColorsProvider getProviderOverride(
    covariant BadgeColorsProvider provider,
  ) {
    return call(
      provider.page,
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
  String? get name => r'badgeColorsProvider';
}

/// See also [badgeColors].
class BadgeColorsProvider extends AutoDisposeFutureProvider<List<Color>> {
  /// See also [badgeColors].
  BadgeColorsProvider(
    SubPagesEnum page,
  ) : this._internal(
          (ref) => badgeColors(
            ref as BadgeColorsRef,
            page,
          ),
          from: badgeColorsProvider,
          name: r'badgeColorsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$badgeColorsHash,
          dependencies: BadgeColorsFamily._dependencies,
          allTransitiveDependencies:
              BadgeColorsFamily._allTransitiveDependencies,
          page: page,
        );

  BadgeColorsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final SubPagesEnum page;

  @override
  Override overrideWith(
    FutureOr<List<Color>> Function(BadgeColorsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BadgeColorsProvider._internal(
        (ref) => create(ref as BadgeColorsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Color>> createElement() {
    return _BadgeColorsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BadgeColorsProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BadgeColorsRef on AutoDisposeFutureProviderRef<List<Color>> {
  /// The parameter `page` of this provider.
  SubPagesEnum get page;
}

class _BadgeColorsProviderElement
    extends AutoDisposeFutureProviderElement<List<Color>> with BadgeColorsRef {
  _BadgeColorsProviderElement(super.provider);

  @override
  SubPagesEnum get page => (origin as BadgeColorsProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
