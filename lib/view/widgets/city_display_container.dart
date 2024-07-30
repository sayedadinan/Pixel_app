
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_app/bloc/autofile_bloc/bloc/auto_fill_bloc.dart';
import 'package:pixel_app/view/utils/color_theme/colors.dart';
import 'package:pixel_app/view/utils/constants/app_text.dart';
import 'package:pixel_app/view/utils/constants/mediaquery.dart';
import 'package:pixel_app/view/utils/constants/paths.dart';

class CityDisplayContainer extends StatelessWidget {
  final int index;
  const CityDisplayContainer({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.dividerColor),
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12)),
      height: mediaqueryheight(0.06, context),
      width: mediaquerywidth(0.44, context),
      child: Center(
        child: CustomText(
            text:
                BlocProvider.of<AutoFillBloc>(context).state.city[index].isEmpty
                    ? 'City'
                    : BlocProvider.of<AutoFillBloc>(context).state.city[index],
            fontFamily: CustomFonts.poppings,
            size: 0.04,
            color: AppColors.blackColor),
      ),
    );
  }
}
