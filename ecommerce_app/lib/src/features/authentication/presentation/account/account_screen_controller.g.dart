// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_screen_controller.dart';

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

String $AccountScreenControllerHash() =>
    r'214c588739a1c695e32a9a386805299d46a9625a';

/// See also [AccountScreenController].
final accountScreenControllerProvider =
    AutoDisposeAsyncNotifierProvider<AccountScreenController, void>(
  AccountScreenController.new,
  name: r'accountScreenControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $AccountScreenControllerHash,
);
typedef AccountScreenControllerRef = AutoDisposeAsyncNotifierProviderRef<void>;

abstract class _$AccountScreenController
    extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build();
}
