// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_date_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentDateBuilderHash() =>
    r'102ae67eb96f278d37b22865acfa61b4157fe4bf';

/// A provider that returns a function that returns the current date.
/// This makes it easy to mock the current date in tests.
///
/// Copied from [currentDateBuilder].
@ProviderFor(currentDateBuilder)
final currentDateBuilderProvider =
    AutoDisposeProvider<DateTime Function()>.internal(
  currentDateBuilder,
  name: r'currentDateBuilderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentDateBuilderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentDateBuilderRef = AutoDisposeProviderRef<DateTime Function()>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
