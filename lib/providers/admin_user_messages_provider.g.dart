// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user_messages_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adminUserMessagesHash() => r'dfd75109903390a281855bde0f67b17124c4241a';

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

abstract class _$AdminUserMessages
    extends BuildlessAutoDisposeAsyncNotifier<List<String>> {
  late final String senderId;
  late final String receiverId;

  FutureOr<List<String>> build(
    String senderId,
    String receiverId,
  );
}

/// See also [AdminUserMessages].
@ProviderFor(AdminUserMessages)
const adminUserMessagesProvider = AdminUserMessagesFamily();

/// See also [AdminUserMessages].
class AdminUserMessagesFamily extends Family<AsyncValue<List<String>>> {
  /// See also [AdminUserMessages].
  const AdminUserMessagesFamily();

  /// See also [AdminUserMessages].
  AdminUserMessagesProvider call(
    String senderId,
    String receiverId,
  ) {
    return AdminUserMessagesProvider(
      senderId,
      receiverId,
    );
  }

  @override
  AdminUserMessagesProvider getProviderOverride(
    covariant AdminUserMessagesProvider provider,
  ) {
    return call(
      provider.senderId,
      provider.receiverId,
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
  String? get name => r'adminUserMessagesProvider';
}

/// See also [AdminUserMessages].
class AdminUserMessagesProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AdminUserMessages, List<String>> {
  /// See also [AdminUserMessages].
  AdminUserMessagesProvider(
    String senderId,
    String receiverId,
  ) : this._internal(
          () => AdminUserMessages()
            ..senderId = senderId
            ..receiverId = receiverId,
          from: adminUserMessagesProvider,
          name: r'adminUserMessagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$adminUserMessagesHash,
          dependencies: AdminUserMessagesFamily._dependencies,
          allTransitiveDependencies:
              AdminUserMessagesFamily._allTransitiveDependencies,
          senderId: senderId,
          receiverId: receiverId,
        );

  AdminUserMessagesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.senderId,
    required this.receiverId,
  }) : super.internal();

  final String senderId;
  final String receiverId;

  @override
  FutureOr<List<String>> runNotifierBuild(
    covariant AdminUserMessages notifier,
  ) {
    return notifier.build(
      senderId,
      receiverId,
    );
  }

  @override
  Override overrideWith(AdminUserMessages Function() create) {
    return ProviderOverride(
      origin: this,
      override: AdminUserMessagesProvider._internal(
        () => create()
          ..senderId = senderId
          ..receiverId = receiverId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        senderId: senderId,
        receiverId: receiverId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AdminUserMessages, List<String>>
      createElement() {
    return _AdminUserMessagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdminUserMessagesProvider &&
        other.senderId == senderId &&
        other.receiverId == receiverId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, senderId.hashCode);
    hash = _SystemHash.combine(hash, receiverId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AdminUserMessagesRef
    on AutoDisposeAsyncNotifierProviderRef<List<String>> {
  /// The parameter `senderId` of this provider.
  String get senderId;

  /// The parameter `receiverId` of this provider.
  String get receiverId;
}

class _AdminUserMessagesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AdminUserMessages,
        List<String>> with AdminUserMessagesRef {
  _AdminUserMessagesProviderElement(super.provider);

  @override
  String get senderId => (origin as AdminUserMessagesProvider).senderId;
  @override
  String get receiverId => (origin as AdminUserMessagesProvider).receiverId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
