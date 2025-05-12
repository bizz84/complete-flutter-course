// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_orders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userOrdersHash() => r'9de05d80e372e45d75dcd35c102c9cde16927978';

/// Watch the list of user orders
/// NOTE: Only watch this provider if the user is signed in.
///
/// Copied from [userOrders].
@ProviderFor(userOrders)
final userOrdersProvider = AutoDisposeStreamProvider<List<Order>>.internal(
  userOrders,
  name: r'userOrdersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userOrdersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserOrdersRef = AutoDisposeStreamProviderRef<List<Order>>;
String _$matchingUserOrdersHash() =>
    r'5e9ebcffedc215312ba9cfe94372243d54c63c75';

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

/// Check if a product was previously purchased by the user
///
/// Copied from [matchingUserOrders].
@ProviderFor(matchingUserOrders)
const matchingUserOrdersProvider = MatchingUserOrdersFamily();

/// Check if a product was previously purchased by the user
///
/// Copied from [matchingUserOrders].
class MatchingUserOrdersFamily extends Family<AsyncValue<List<Order>>> {
  /// Check if a product was previously purchased by the user
  ///
  /// Copied from [matchingUserOrders].
  const MatchingUserOrdersFamily();

  /// Check if a product was previously purchased by the user
  ///
  /// Copied from [matchingUserOrders].
  MatchingUserOrdersProvider call(
    String id,
  ) {
    return MatchingUserOrdersProvider(
      id,
    );
  }

  @override
  MatchingUserOrdersProvider getProviderOverride(
    covariant MatchingUserOrdersProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'matchingUserOrdersProvider';
}

/// Check if a product was previously purchased by the user
///
/// Copied from [matchingUserOrders].
class MatchingUserOrdersProvider
    extends AutoDisposeStreamProvider<List<Order>> {
  /// Check if a product was previously purchased by the user
  ///
  /// Copied from [matchingUserOrders].
  MatchingUserOrdersProvider(
    String id,
  ) : this._internal(
          (ref) => matchingUserOrders(
            ref as MatchingUserOrdersRef,
            id,
          ),
          from: matchingUserOrdersProvider,
          name: r'matchingUserOrdersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$matchingUserOrdersHash,
          dependencies: MatchingUserOrdersFamily._dependencies,
          allTransitiveDependencies:
              MatchingUserOrdersFamily._allTransitiveDependencies,
          id: id,
        );

  MatchingUserOrdersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    Stream<List<Order>> Function(MatchingUserOrdersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MatchingUserOrdersProvider._internal(
        (ref) => create(ref as MatchingUserOrdersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Order>> createElement() {
    return _MatchingUserOrdersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MatchingUserOrdersProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MatchingUserOrdersRef on AutoDisposeStreamProviderRef<List<Order>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _MatchingUserOrdersProviderElement
    extends AutoDisposeStreamProviderElement<List<Order>>
    with MatchingUserOrdersRef {
  _MatchingUserOrdersProviderElement(super.provider);

  @override
  String get id => (origin as MatchingUserOrdersProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
