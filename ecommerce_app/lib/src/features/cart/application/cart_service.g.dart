// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String $cartServiceHash() => r'db56fab553dde3f2dafbe456c14e199a66bab2d5';

/// See also [cartService].
final cartServiceProvider = Provider<CartService>(
  cartService,
  name: r'cartServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $cartServiceHash,
);
typedef CartServiceRef = ProviderRef<CartService>;
String $cartItemsCountHash() => r'c8d67d2c5fa13d83da6dec350bca0418820ad8d8';

/// See also [cartItemsCount].
final cartItemsCountProvider = Provider<int>(
  cartItemsCount,
  name: r'cartItemsCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $cartItemsCountHash,
);
typedef CartItemsCountRef = ProviderRef<int>;
String $cartTotalHash() => r'620fa13b324b41b44713aede70cb19b607f395cb';

/// See also [cartTotal].
final cartTotalProvider = AutoDisposeProvider<double>(
  cartTotal,
  name: r'cartTotalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $cartTotalHash,
);
typedef CartTotalRef = AutoDisposeProviderRef<double>;
String $itemAvailableQuantityHash() =>
    r'bf8ea212feaa0322b97753a9a241cbd1da278c2f';

/// See also [itemAvailableQuantity].
class ItemAvailableQuantityProvider extends AutoDisposeProvider<int> {
  ItemAvailableQuantityProvider(
    this.product,
  ) : super(
          (ref) => itemAvailableQuantity(
            ref,
            product,
          ),
          from: itemAvailableQuantityProvider,
          name: r'itemAvailableQuantityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $itemAvailableQuantityHash,
        );

  final Product product;

  @override
  bool operator ==(Object other) {
    return other is ItemAvailableQuantityProvider && other.product == product;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, product.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef ItemAvailableQuantityRef = AutoDisposeProviderRef<int>;

/// See also [itemAvailableQuantity].
final itemAvailableQuantityProvider = ItemAvailableQuantityFamily();

class ItemAvailableQuantityFamily extends Family<int> {
  ItemAvailableQuantityFamily();

  ItemAvailableQuantityProvider call(
    Product product,
  ) {
    return ItemAvailableQuantityProvider(
      product,
    );
  }

  @override
  AutoDisposeProvider<int> getProviderOverride(
    covariant ItemAvailableQuantityProvider provider,
  ) {
    return call(
      provider.product,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'itemAvailableQuantityProvider';
}
