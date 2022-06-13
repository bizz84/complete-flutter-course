import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final dateFormatterProvider = Provider<DateFormat>((ref) {
  /// Date formatter to be used in the app.
  return DateFormat.MMMEd();
});
