// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reviewsServiceHash() => r'd91877727c3a90c4267086fa9cd81c8ab6938afd';

/// See also [reviewsService].
@ProviderFor(reviewsService)
final reviewsServiceProvider = Provider<ReviewsService>.internal(
  reviewsService,
  name: r'reviewsServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reviewsServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ReviewsServiceRef = ProviderRef<ReviewsService>;
String _$userReviewFutureHash() => r'a0946dc6e8e861944f7a069a345f1036879b5b1f';

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

/// Check if a product was previously reviewed by the user
///
/// Copied from [userReviewFuture].
@ProviderFor(userReviewFuture)
const userReviewFutureProvider = UserReviewFutureFamily();

/// Check if a product was previously reviewed by the user
///
/// Copied from [userReviewFuture].
class UserReviewFutureFamily extends Family<AsyncValue<Review?>> {
  /// Check if a product was previously reviewed by the user
  ///
  /// Copied from [userReviewFuture].
  const UserReviewFutureFamily();

  /// Check if a product was previously reviewed by the user
  ///
  /// Copied from [userReviewFuture].
  UserReviewFutureProvider call(
    String id,
  ) {
    return UserReviewFutureProvider(
      id,
    );
  }

  @override
  UserReviewFutureProvider getProviderOverride(
    covariant UserReviewFutureProvider provider,
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
  String? get name => r'userReviewFutureProvider';
}

/// Check if a product was previously reviewed by the user
///
/// Copied from [userReviewFuture].
class UserReviewFutureProvider extends AutoDisposeFutureProvider<Review?> {
  /// Check if a product was previously reviewed by the user
  ///
  /// Copied from [userReviewFuture].
  UserReviewFutureProvider(
    String id,
  ) : this._internal(
          (ref) => userReviewFuture(
            ref as UserReviewFutureRef,
            id,
          ),
          from: userReviewFutureProvider,
          name: r'userReviewFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userReviewFutureHash,
          dependencies: UserReviewFutureFamily._dependencies,
          allTransitiveDependencies:
              UserReviewFutureFamily._allTransitiveDependencies,
          id: id,
        );

  UserReviewFutureProvider._internal(
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
    FutureOr<Review?> Function(UserReviewFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserReviewFutureProvider._internal(
        (ref) => create(ref as UserReviewFutureRef),
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
  AutoDisposeFutureProviderElement<Review?> createElement() {
    return _UserReviewFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserReviewFutureProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserReviewFutureRef on AutoDisposeFutureProviderRef<Review?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _UserReviewFutureProviderElement
    extends AutoDisposeFutureProviderElement<Review?> with UserReviewFutureRef {
  _UserReviewFutureProviderElement(super.provider);

  @override
  String get id => (origin as UserReviewFutureProvider).id;
}

String _$userReviewStreamHash() => r'63d6101443637e0a266dbb2c496abfe44113218f';

/// Check if a product was previously reviewed by the user
///
/// Copied from [userReviewStream].
@ProviderFor(userReviewStream)
const userReviewStreamProvider = UserReviewStreamFamily();

/// Check if a product was previously reviewed by the user
///
/// Copied from [userReviewStream].
class UserReviewStreamFamily extends Family<AsyncValue<Review?>> {
  /// Check if a product was previously reviewed by the user
  ///
  /// Copied from [userReviewStream].
  const UserReviewStreamFamily();

  /// Check if a product was previously reviewed by the user
  ///
  /// Copied from [userReviewStream].
  UserReviewStreamProvider call(
    String id,
  ) {
    return UserReviewStreamProvider(
      id,
    );
  }

  @override
  UserReviewStreamProvider getProviderOverride(
    covariant UserReviewStreamProvider provider,
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
  String? get name => r'userReviewStreamProvider';
}

/// Check if a product was previously reviewed by the user
///
/// Copied from [userReviewStream].
class UserReviewStreamProvider extends AutoDisposeStreamProvider<Review?> {
  /// Check if a product was previously reviewed by the user
  ///
  /// Copied from [userReviewStream].
  UserReviewStreamProvider(
    String id,
  ) : this._internal(
          (ref) => userReviewStream(
            ref as UserReviewStreamRef,
            id,
          ),
          from: userReviewStreamProvider,
          name: r'userReviewStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userReviewStreamHash,
          dependencies: UserReviewStreamFamily._dependencies,
          allTransitiveDependencies:
              UserReviewStreamFamily._allTransitiveDependencies,
          id: id,
        );

  UserReviewStreamProvider._internal(
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
    Stream<Review?> Function(UserReviewStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserReviewStreamProvider._internal(
        (ref) => create(ref as UserReviewStreamRef),
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
  AutoDisposeStreamProviderElement<Review?> createElement() {
    return _UserReviewStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserReviewStreamProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserReviewStreamRef on AutoDisposeStreamProviderRef<Review?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _UserReviewStreamProviderElement
    extends AutoDisposeStreamProviderElement<Review?> with UserReviewStreamRef {
  _UserReviewStreamProviderElement(super.provider);

  @override
  String get id => (origin as UserReviewStreamProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
