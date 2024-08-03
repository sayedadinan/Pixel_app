import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_app/bloc/user_bloc/user_bloc.dart';
import 'package:pixel_app/view/utils/color_theme/colors.dart';
import 'package:pixel_app/view/utils/constants/app_text.dart';
import 'package:pixel_app/view/utils/constants/mediaquery.dart';
import 'package:pixel_app/view/utils/constants/paths.dart';

class MainTagWidget extends StatelessWidget {
  const MainTagWidget({
    super.key,
    required this.id,
    required this.name,
    required this.panNumber,
    required this.phone,
  });

  final String id;
  final String name;
  final String panNumber;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomText(
            text: 'User Details',
            fontFamily: CustomFonts.inknut,
            size: 0.06,
            color: AppColors.blackColor),
        IconButton(
            onPressed: () {
              context.read<UserBloc>().add(UserDeleteEvent(id: id));
            },
            icon: Icon(
              Icons.delete,
              size: mediaquerywidth(0.14, context),
            )),
        IconButton(
            onPressed: () {
              context.read<UserBloc>().add(UserUpdateEvent(
                  email: '', name: name, pan: panNumber, phone: phone));
            },
            icon: Icon(
              Icons.edit,
              size: mediaquerywidth(0.14, context),
            )),
      ],
    );
  }
}
