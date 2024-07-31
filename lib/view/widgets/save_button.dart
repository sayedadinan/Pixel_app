import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_app/bloc/user_bloc/user_bloc.dart';
import 'package:pixel_app/view/screens/user_adding_screen.dart';

import 'package:pixel_app/view/utils/color_theme/colors.dart';
import 'package:pixel_app/view/utils/constants/app_button.dart';
import 'package:pixel_app/view/utils/constants/mediaquery.dart';
import 'package:pixel_app/view/utils/constants/paths.dart';

class CustomSaveButton extends StatelessWidget {
  const CustomSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaqueryheight(0.07, context),
      child: CustomButton(
          function: () {
            if (registerKey.currentState!.validate()) {
              log('validate');
    
              context.read<UserBloc>().add(
                    UserAddEvent(
                      email: emailController.text,
                      name: nameController.text,
                      pan: panController.text,
                      phone: phoneController.text,
                      addressTable: addressList,
                    ),
                  );
            }
          },
          text: 'Save Data',
          fontSize: 0.04,
          buttonTextColor: AppColors.whiteColor,
          borderColor: AppColors.transparentColor,
          fontFamily: CustomFonts.inknut),
    );
  }
}
