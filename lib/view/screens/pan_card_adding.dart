import 'dart:developer';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_app/bloc/address_bloc/bloc/address_bloc.dart';
import 'package:pixel_app/bloc/autofile_bloc/bloc/auto_fill_bloc.dart';
import 'package:pixel_app/bloc/bloc/validation_bloc.dart';
import 'package:pixel_app/data/model/address_model.dart';
import 'package:pixel_app/view/utils/color_theme/colors.dart';
import 'package:pixel_app/view/utils/constants/app_button.dart';
import 'package:pixel_app/view/utils/constants/app_text.dart';
import 'package:pixel_app/view/utils/constants/app_textfield.dart';
import 'package:pixel_app/view/utils/constants/mediaquery.dart';
import 'package:pixel_app/view/utils/constants/padding_.dart';
import 'package:pixel_app/view/utils/constants/paths.dart';
import 'package:pixel_app/view/utils/constants/sizedbox.dart';
import 'package:pixel_app/view/widgets/address_title.dart';
import 'package:pixel_app/view/widgets/city_display_container.dart';
import 'package:pixel_app/view/widgets/city_state_container.dart';
import 'package:pixel_app/view/widgets/pancard_field.dart';

final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
final List<AddressModel> addressList = [];

class PanCardAddingScreen extends StatelessWidget {
  const PanCardAddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: commonScreenPadding(context),
          child: Form(
            key: registerKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomSizedBoxHeight(height: 0.03),
                const CustomText(
                  color: AppColors.blackColor,
                  fontFamily: CustomFonts.inknut,
                  size: 0.05,
                  text: 'Give Pancard Details',
                ),
                const CustomSizedBoxHeight(height: 0.03),
                Inputfield(
                  textInputFormatter: [LengthLimitingTextInputFormatter(140)],
                  hinttext: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const CustomSizedBoxHeight(height: 0.02),
                Inputfield(
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
                ),
                const CustomSizedBoxHeight(
                  height: 0.02,
                ),
                Inputfield(
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
                    }),
                const CustomSizedBoxHeight(
                  height: 0.02,
                ),
                const PanInputBox(),
                const CustomSizedBoxHeight(
                  height: 0.02,
                ),
                const AddressTitle(),
                const Divider(color: AppColors.dividerColor),
                const CustomSizedBoxHeight(height: 0.01),
                BlocBuilder<AddressBloc, AddressState>(
                  builder: (context, state) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.itemCount,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Inputfield(
                                controller: state.addressControllers[index],
                                hinttext: 'Address',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please enter a address';
                                  }
                                  return null;
                                }),
                            const CustomSizedBoxHeight(height: 0.02),
                            Inputfield(
                                onChanged: (value) {
                                  context
                                      .read<AutoFillBloc>()
                                      .add(PostValAdded(val: value!));
                                  return null;
                                },
                                controller: state.postcodeControllers[index],
                                textInputFormatter: [
                                  LengthLimitingTextInputFormatter(6)
                                ],
                                hinttext: 'PostCode',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please enter a postcode';
                                  } else if (!isDigit(value)) {
                                    return 'please enter valuable';
                                  }
                                  return null;
                                }),
                            const CustomSizedBoxHeight(height: 0.02),
                            Row(children: [
                              PostAutoContainer(index: index),
                              const CustomSizedBoxWidth(0.01),
                              CityDisplayContainer(index: index)
                            ]),
                            const CustomSizedBoxHeight(height: 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      print(
                                          BlocProvider.of<AutoFillBloc>(context)
                                              .state
                                              .city[index]);
                                      if (state.addressControllers[index].text
                                              .isNotEmpty &&
                                          state.postcodeControllers[index].text
                                              .isNotEmpty) {
                                        addressList.add(AddressModel(
                                            address: state
                                                .addressControllers[index].text,
                                            postCode: state
                                                .postcodeControllers[index]
                                                .text,
                                            state:
                                                BlocProvider.of<AutoFillBloc>(
                                                        context)
                                                    .state
                                                    .state[index],
                                            city: BlocProvider.of<AutoFillBloc>(
                                                    context)
                                                .state
                                                .city[index]));
                                      }
                                      for (int i = 0;
                                          i < addressList.length;
                                          i++) {
                                        print(addressList[i].address);
                                      }
                                    },
                                    child: Icon(Icons.done))
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                SizedBox(
                  height: mediaqueryheight(0.07, context),
                  child: CustomButton(
                      function: () {
                        if (registerKey.currentState!.validate()) {
                          log('validate');
                        }
                      },
                      text: 'Save Data',
                      fontSize: 0.04,
                      buttonTextColor: AppColors.whiteColor,
                      borderColor: AppColors.transparentColor,
                      fontFamily: CustomFonts.inknut),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
