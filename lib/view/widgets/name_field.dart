import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixel_app/view/screens/user_adding_screen.dart';
import 'package:pixel_app/view/utils/constants/app_textfield.dart';

class NameField extends StatelessWidget {
  const NameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Inputfield(
      controller: nameController,
      textInputFormatter: [LengthLimitingTextInputFormatter(140)],
      hinttext: 'Name',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a name';
        }
        return null;
      },
    );
  }
}
