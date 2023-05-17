// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fake_auth_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRepositoryHash() => r'81f3424b3280964cd0270a9bbf8a93deb47c36e7';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = Provider<FakeAuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRepositoryRef = ProviderRef<FakeAuthRepository>;
String _$authStateChangesHash() => r'199a9132d64e85888f728def3717a5163d8558aa';

/// See also [authStateChanges].
@ProviderFor(authStateChanges)
final authStateChangesProvider = StreamProvider<AppUser?>.internal(
  authStateChanges,
  name: r'authStateChangesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthStateChangesRef = StreamProviderRef<AppUser?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
