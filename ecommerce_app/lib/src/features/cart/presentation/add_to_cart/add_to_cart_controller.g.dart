// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_controller.dart';

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

String $AddToCartControllerHash() =>
    r'9561d9e66460bf7ea99dce03b7a5900b38a7f930';

/// See also [AddToCartController].
final addToCartControllerProvider =
    AutoDisposeAsyncNotifierProvider<AddToCartController, void>(
  AddToCartController.new,
  name: r'addToCartControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $AddToCartControllerHash,
);
typedef AddToCartControllerRef = AutoDisposeAsyncNotifierProviderRef<void>;

abstract class _$AddToCartController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build();
}

String $ItemQuantityControllerHash() =>
    r'e3aebb6b912ee6ef8fd2ff6b1ab26201380f7862';

/// See also [ItemQuantityController].
final itemQuantityControllerProvider =
    AutoDisposeNotifierProvider<ItemQuantityController, int>(
  ItemQuantityController.new,
  name: r'itemQuantityControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $ItemQuantityControllerHash,
);
typedef ItemQuantityControllerRef = AutoDisposeNotifierProviderRef<int>;

abstract class _$ItemQuantityController extends AutoDisposeNotifier<int> {
  @override
  int build();
}
