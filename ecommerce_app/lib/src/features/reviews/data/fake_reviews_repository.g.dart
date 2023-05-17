// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fake_reviews_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reviewsRepositoryHash() => r'8a69281fa37026cd50057faf754621a4e46629e5';

/// See also [reviewsRepository].
@ProviderFor(reviewsRepository)
final reviewsRepositoryProvider = Provider<FakeReviewsRepository>.internal(
  reviewsRepository,
  name: r'reviewsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reviewsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ReviewsRepositoryRef = ProviderRef<FakeReviewsRepository>;
String _$productReviewsHash() => r'a406f54f708a91b59663ad194a30c08533f20ca8';

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

typedef ProductReviewsRef = AutoDisposeStreamProviderRef<List<Review>>;

/// See also [productReviews].
@ProviderFor(productReviews)
const productReviewsProvider = ProductReviewsFamily();

/// See also [productReviews].
class ProductReviewsFamily extends Family<AsyncValue<List<Review>>> {
  /// See also [productReviews].
  const ProductReviewsFamily();

  /// See also [productReviews].
  ProductReviewsProvider call(
    String id,
  ) {
    return ProductReviewsProvider(
      id,
    );
  }

  @override
  ProductReviewsProvider getProviderOverride(
    covariant ProductReviewsProvider provider,
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
  String? get name => r'productReviewsProvider';
}

/// See also [productReviews].
class ProductReviewsProvider extends AutoDisposeStreamProvider<List<Review>> {
  /// See also [productReviews].
  ProductReviewsProvider(
    this.id,
  ) : super.internal(
          (ref) => productReviews(
            ref,
            id,
          ),
          from: productReviewsProvider,
          name: r'productReviewsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productReviewsHash,
          dependencies: ProductReviewsFamily._dependencies,
          allTransitiveDependencies:
              ProductReviewsFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is ProductReviewsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
