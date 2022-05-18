import 'package:ecommerce_app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/common_widgets/primary_button.dart';
import 'package:ecommerce_app/src/common_widgets/responsive_scrollable_card.dart';
import 'package:ecommerce_app/src/constants/app_sizes.dart';

/// A page where the user can enter and submit all the address details.
/// * This page is not yet in use. We will add it to the checkout flows later.
class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key, this.onSubmit});
  final VoidCallback? onSubmit;

  // * Keys for testing using find.byKey()
  static const addressKey = Key('address');
  static const townCityKey = Key('townCity');
  static const stateKey = Key('state');
  static const postalCodeKey = Key('postalCode');
  static const countryKey = Key('country');
  static const scrollableKey = Key('addressPageScrollable');

  @override
  State<AddressScreen> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();

  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _countryController = TextEditingController();

  final _isLoading = false;

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _postalCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      // TODO: uncomment and submit the address
      // final address = Address(
      //   address: _addressController.value.text,
      //   city: _cityController.value.text,
      //   state: _stateController.value.text,
      //   postalCode: _postalCodeController.value.text,
      //   country: _countryController.value.text,
      // );
      // TODO: Only fire callback if submission is successful
      widget.onSubmit?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScrollableCard(
      key: AddressScreen.scrollableKey,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AddressFormField(
              formFieldKey: AddressScreen.addressKey,
              controller: _addressController,
              labelText: 'Address'.hardcoded,
              keyboardType: TextInputType.streetAddress,
              enabled: !_isLoading,
            ),
            gapH8,
            AddressFormField(
              formFieldKey: AddressScreen.townCityKey,
              controller: _cityController,
              labelText: 'Town/City'.hardcoded,
              keyboardType: TextInputType.streetAddress,
              enabled: !_isLoading,
            ),
            gapH8,
            AddressFormField(
              formFieldKey: AddressScreen.stateKey,
              controller: _stateController,
              labelText: 'State'.hardcoded,
              keyboardType: TextInputType.streetAddress,
              enabled: !_isLoading,
            ),
            gapH8,
            AddressFormField(
              formFieldKey: AddressScreen.postalCodeKey,
              controller: _postalCodeController,
              labelText: 'Postal Code'.hardcoded,
              keyboardType: TextInputType.streetAddress,
              enabled: !_isLoading,
            ),
            gapH8,
            AddressFormField(
              formFieldKey: AddressScreen.countryKey,
              controller: _countryController,
              labelText: 'Country'.hardcoded,
              keyboardType: TextInputType.streetAddress,
              enabled: !_isLoading,
            ),
            gapH8,
            PrimaryButton(
              text: 'Submit'.hardcoded,
              onPressed: _submit,
              isLoading: _isLoading,
            )
          ],
        ),
      ),
    );
  }
}

// Reusable address form field
class AddressFormField extends StatelessWidget {
  const AddressFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.keyboardType,
    this.enabled = true,
    this.formFieldKey,
  });

  /// Controller used to read out the value in the parent widget
  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;

  /// Whether the text field is enabled or not
  final bool enabled;

  /// Key used in the widget tests
  final Key? formFieldKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formFieldKey,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        enabled: enabled,
      ),
      autocorrect: true,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      keyboardAppearance: Brightness.light,
      validator: (value) =>
          value?.isNotEmpty == true ? null : 'Can\'t be empty'.hardcoded,
    );
  }
}
