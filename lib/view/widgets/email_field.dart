

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixel_app/view/screens/user_adding_screen.dart';

import '../utils/constants/app_textfield.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Inputfield(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      hinttext: 'Email',
      textInputFormatter: [LengthLimitingTextInputFormatter(255)],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an email';
        } else if (!EmailValidator.validate(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }
}
