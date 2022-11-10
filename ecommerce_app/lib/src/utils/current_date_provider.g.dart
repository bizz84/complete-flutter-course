// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_date_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentDateBuilderHash() =>
    r'693d3ea8bc060403f97448bd270df9195161317e';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentDateBuilderRef = AutoDisposeProviderRef<DateTime Function()>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
