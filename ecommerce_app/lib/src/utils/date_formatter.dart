import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'date_formatter.g.dart';

@riverpod
DateFormat dateFormatter(Ref ref) {
  /// Date formatter to be used in the app.
  return DateFormat.MMMEd();
}
