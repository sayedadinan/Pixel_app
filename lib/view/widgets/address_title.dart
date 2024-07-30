
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_app/bloc/address_bloc/bloc/address_bloc.dart';
import 'package:pixel_app/view/utils/color_theme/colors.dart';
import 'package:pixel_app/view/utils/constants/app_text.dart';
import 'package:pixel_app/view/utils/constants/mediaquery.dart';
import 'package:pixel_app/view/utils/constants/paths.dart';
class AddressTitle extends StatelessWidget {
  const AddressTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomText(
            text: 'Address Here',
            fontFamily: CustomFonts.poppings,
            size: 0.04,
            color: AppColors.blackColor),
        GestureDetector(
          onTap: () {
            context.read<AddressBloc>().add(AddMoreClicked());
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.dividerColor),
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12)),
            height: mediaqueryheight(0.03, context),
            width: mediaquerywidth(0.25, context),
            child: const Center(
              child: CustomText(
                  text: 'Add more',
                  fontFamily: CustomFonts.poppings,
                  size: 0.04,
                  color: AppColors.blackColor),
            ),
          ),
        ),
      ],
    );
  }
}
