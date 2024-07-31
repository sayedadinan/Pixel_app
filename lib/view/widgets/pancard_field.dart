import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_app/bloc/validation_bloc/validation_bloc.dart';
import 'package:pixel_app/view/utils/color_theme/colors.dart';
import 'package:pixel_app/view/utils/constants/app_textfield.dart';

class PanInputBox extends StatelessWidget {
  final TextEditingController controller;
  const PanInputBox({
    required this.controller,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationBloc, ValidationState>(
      builder: (context, state) {
        return Inputfield(
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a Pan Number';
            }
            return null;
          },
          //here we are going to check the value is valid or not
          suffix: state is PanLoading
              ? Transform.scale(
                  scale: 0.5, child: const CircularProgressIndicator())
              : state is PanNotValid
                  ? const Icon(
                      Icons.error_outline,
                      color: AppColors.errorColor,
                    )
                  : state is PanVerified
                      ? const Icon(
                          Icons.done,
                          color: AppColors.succesIconColor,
                        )
                      : null,
          onChanged: (value) {
            context.read<ValidationBloc>().add(PanValClicked(val: value!));
            return null;
          },
          hinttext: 'Pan Card Number',
        );
      },
    );
  }
}
