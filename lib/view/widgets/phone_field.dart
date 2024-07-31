
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixel_app/view/screens/user_adding_screen.dart';
import 'package:pixel_app/view/utils/constants/app_textfield.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Inputfield(
        controller: phoneController,
        hinttext: 'Mobile Number',
        textInputFormatter: [LengthLimitingTextInputFormatter(10)],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a phone number';
          } else {
            final regex = RegExp(r'^[6-9]\d{9}$');
            if (!regex.hasMatch(value)) {
              return 'Please enter a valid Indian phone number';
            }
          }
          return null;
        });
  }
}