import 'package:ecommerce_app/src/common_widgets/alert_dialogs.dart';
import 'package:ecommerce_app/src/localization/string_hardcoded.dart';
import 'package:ecommerce_app/src/models/app_user.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/common_widgets/action_text_button.dart';
import 'package:ecommerce_app/src/common_widgets/responsive_center.dart';
import 'package:ecommerce_app/src/constants/app_sizes.dart';

/// Simple account screen showing some user info and a logout button.
class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'.hardcoded),
        actions: [
          ActionTextButton(
            text: 'Logout'.hardcoded,
            onPressed: () async {
              showNotImplementedAlertDialog(context: context);
              // final logout = await showAlertDialog(
              //   context: context,
              //   title: 'Are you sure?'.hardcoded,
              //   cancelActionText: 'Cancel'.hardcoded,
              //   defaultActionText: 'Logout'.hardcoded,
              // );
              // if (logout == true) {
              //   // TODO: Sign out the user.
              //   Navigator.of(context).pop();
              // }
            },
          ),
        ],
      ),
      body: const ResponsiveCenter(
        padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: UserDataTable(),
      ),
    );
  }
}

/// Simple user data table showing the uid and email
class UserDataTable extends StatelessWidget {
  const UserDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.subtitle2!;
    // TODO: get user from auth repository
    const user = AppUser(uid: '123', email: 'test@test.com');
    return DataTable(
      columns: [
        DataColumn(
          label: Text(
            'Field'.hardcoded,
            style: style,
          ),
        ),
        DataColumn(
          label: Text(
            'Value'.hardcoded,
            style: style,
          ),
        ),
      ],
      rows: [
        _makeDataRow(
          'uid'.hardcoded,
          user.uid,
          style,
        ),
        _makeDataRow(
          'email'.hardcoded,
          user.email ?? '',
          style,
        ),
      ],
    );
  }

  DataRow _makeDataRow(String name, String value, TextStyle style) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            name,
            style: style,
          ),
        ),
        DataCell(
          Text(
            value,
            style: style,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
