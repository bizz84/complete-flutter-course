// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fake_products_repository.dart';

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

String $productsRepositoryHash() => r'201c3eee525a7f0e114e2c35f87c15487b91626e';

/// See also [productsRepository].
final productsRepositoryProvider = AutoDisposeProvider<FakeProductsRepository>(
  productsRepository,
  name: r'productsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $productsRepositoryHash,
);
typedef ProductsRepositoryRef = AutoDisposeProviderRef<FakeProductsRepository>;
String $productsListFutureHash() => r'8f018bf574c889710ce2ba492782d7bb421cfbed';

/// See also [productsListFuture].
final productsListFutureProvider = AutoDisposeFutureProvider<List<Product>>(
  productsListFuture,
  name: r'productsListFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $productsListFutureHash,
);
typedef ProductsListFutureRef = AutoDisposeFutureProviderRef<List<Product>>;
String $productsListSearchHash() => r'5d52cdad8654fc1d561ddd74fa4d98aaad39de61';

/// See also [productsListSearch].
class ProductsListSearchProvider
    extends AutoDisposeFutureProvider<List<Product>> {
  ProductsListSearchProvider(
    this.query,
  ) : super(
          (ref) => productsListSearch(
            ref,
            query,
          ),
          from: productsListSearchProvider,
          name: r'productsListSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $productsListSearchHash,
        );

  final String query;

  @override
  bool operator ==(Object other) {
    return other is ProductsListSearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef ProductsListSearchRef = AutoDisposeFutureProviderRef<List<Product>>;

/// See also [productsListSearch].
final productsListSearchProvider = ProductsListSearchFamily();

class ProductsListSearchFamily extends Family<AsyncValue<List<Product>>> {
  ProductsListSearchFamily();

  ProductsListSearchProvider call(
    String query,
  ) {
    return ProductsListSearchProvider(
      query,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Product>> getProviderOverride(
    covariant ProductsListSearchProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'productsListSearchProvider';
}
