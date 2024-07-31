import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_app/bloc/user_bloc/user_bloc.dart';
import 'package:pixel_app/data/model/address_model.dart';
import 'package:pixel_app/data/repositery/data_funtions.dart';
import 'package:pixel_app/view/screens/user_list_screen.dart';
import 'package:pixel_app/view/utils/color_theme/colors.dart';
import 'package:pixel_app/view/utils/constants/app_text.dart';
import 'package:pixel_app/view/utils/constants/navigations.dart';
import 'package:pixel_app/view/utils/constants/padding_.dart';
import 'package:pixel_app/view/utils/constants/paths.dart';
import 'package:pixel_app/view/utils/constants/sizedbox.dart';
import 'package:pixel_app/view/widgets/address_section.dart';
import 'package:pixel_app/view/widgets/address_title.dart';
import 'package:pixel_app/view/widgets/email_field.dart';
import 'package:pixel_app/view/widgets/name_field.dart';
import 'package:pixel_app/view/widgets/pancard_field.dart';
import 'package:pixel_app/view/widgets/phone_field.dart';
import 'package:pixel_app/view/widgets/save_button.dart';

final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
final List<AddressTable> addressList = [];
final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController panController = TextEditingController();

class PanCardAddingScreen extends StatelessWidget {
  const PanCardAddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HiveService().getPanData();
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserSuccessState) {
          PageNavigations().pushAndRemoveUntill(const UserListScreen());
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                      text: 'Give Pancard Details'),
                  const CustomSizedBoxHeight(height: 0.03),
                  const NameField(),
                  const CustomSizedBoxHeight(height: 0.02),
                  const EmailField(),
                  const CustomSizedBoxHeight(height: 0.02),
                  const PhoneField(),
                  const CustomSizedBoxHeight(height: 0.02),
                  PanInputBox(controller: panController),
                  const CustomSizedBoxHeight(height: 0.02),
                  const AddressTitle(),
                  const Divider(color: AppColors.dividerColor),
                  const CustomSizedBoxHeight(height: 0.01),
                  AddressSection(addressList: addressList),
                  const CustomSaveButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
