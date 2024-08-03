import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_app/bloc/user_bloc/user_bloc.dart';
import 'package:pixel_app/view/utils/color_theme/colors.dart';
import 'package:pixel_app/view/utils/constants/app_text.dart';
import 'package:pixel_app/view/utils/constants/navigations.dart';
import 'package:pixel_app/view/utils/constants/padding_.dart';
import 'package:pixel_app/view/utils/constants/paths.dart';
import 'package:pixel_app/view/utils/constants/sizedbox.dart';
import 'package:pixel_app/view/widgets/main_tag_widget.dart';

class DetailsScreen extends StatelessWidget {
  final String name;
  final String panNumber;
  final String phone;
  final String address;
  final String postCode;
  final String state;
  final String city;
  final int index;
  final String id;
  const DetailsScreen(
      {super.key,
      required this.name,
      required this.panNumber,
      required this.phone,
      required this.address,
      required this.postCode,
      required this.state,
      required this.city,
      required this.index,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserSuccessState) {
          PageNavigations().pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: commonScreenPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomSizedBoxHeight(height: 0.02),
              CircleAvatar(
                maxRadius: 70,
                child: CustomText(
                    text: index.toString(),
                    fontFamily: CustomFonts.poppings,
                    size: 0.17,
                    color: AppColors.blackColor),
              ),
              const CustomSizedBoxHeight(height: 0.03),
              MainTagWidget(
                  id: id, name: name, panNumber: panNumber, phone: phone),
              const Divider(),
              const CustomSizedBoxHeight(height: 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                      text: 'User Name :',
                      fontFamily: CustomFonts.poppings,
                      size: 0.06,
                      color: AppColors.blackColor),
                  CustomText(
                      text: name,
                      fontFamily: CustomFonts.poppings,
                      size: 0.05,
                      color: AppColors.blackColor),
                ],
              ),
              const CustomSizedBoxHeight(height: 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                      text: 'PanCard Number :',
                      fontFamily: CustomFonts.poppings,
                      size: 0.06,
                      color: AppColors.blackColor),
                  CustomText(
                      text: panNumber,
                      fontFamily: CustomFonts.poppings,
                      size: 0.05,
                      color: AppColors.blackColor),
                ],
              ),
              const CustomSizedBoxHeight(height: 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                      text: 'Phone Number :',
                      fontFamily: CustomFonts.poppings,
                      size: 0.06,
                      color: AppColors.blackColor),
                  CustomText(
                      text: phone,
                      fontFamily: CustomFonts.poppings,
                      size: 0.05,
                      color: AppColors.blackColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
