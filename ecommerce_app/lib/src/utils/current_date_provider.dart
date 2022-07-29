import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A provider that returns a function that returns the current date.
/// This makes it easy to mock the current date in tests.
final currentDateBuilderProvider = Provider<DateTime Function()>((ref) {
  return () => DateTime.now();
});
