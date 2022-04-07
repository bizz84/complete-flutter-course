import 'package:ecommerce_app/src/common_widgets/alert_dialogs.dart';
import 'package:ecommerce_app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef VoidAsyncValue = AsyncValue<void>;

extension AsyncValueUI on VoidAsyncValue {
  void showAlertDialogOnError(BuildContext context) => whenOrNull(
        error: (error, _) => showExceptionAlertDialog(
          context: context,
          title: 'Error'.hardcoded,
          exception: error,
        ),
      );
}
