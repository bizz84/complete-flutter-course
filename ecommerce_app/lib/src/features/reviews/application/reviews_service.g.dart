// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_service.dart';

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

String $reviewsServiceHash() => r'd91877727c3a90c4267086fa9cd81c8ab6938afd';

/// See also [reviewsService].
final reviewsServiceProvider = Provider<ReviewsService>(
  reviewsService,
  name: r'reviewsServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $reviewsServiceHash,
);
typedef ReviewsServiceRef = ProviderRef<ReviewsService>;
String $userReviewFutureHash() => r'98a78f997bf77c9b2cb80da2ddb23242c933893f';

/// Check if a product was previously reviewed by the user
///
/// Copied from [userReviewFuture].
class UserReviewFutureProvider extends AutoDisposeFutureProvider<Review?> {
  UserReviewFutureProvider(
    this.productId,
  ) : super(
          (ref) => userReviewFuture(
            ref,
            productId,
          ),
          from: userReviewFutureProvider,
          name: r'userReviewFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $userReviewFutureHash,
        );

  final String productId;

  @override
  bool operator ==(Object other) {
    return other is UserReviewFutureProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef UserReviewFutureRef = AutoDisposeFutureProviderRef<Review?>;

/// Check if a product was previously reviewed by the user
///
/// Copied from [userReviewFuture].
final userReviewFutureProvider = UserReviewFutureFamily();

class UserReviewFutureFamily extends Family<AsyncValue<Review?>> {
  UserReviewFutureFamily();

  UserReviewFutureProvider call(
    String productId,
  ) {
    return UserReviewFutureProvider(
      productId,
    );
  }

  @override
  AutoDisposeFutureProvider<Review?> getProviderOverride(
    covariant UserReviewFutureProvider provider,
  ) {
    return call(
      provider.productId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'userReviewFutureProvider';
}
