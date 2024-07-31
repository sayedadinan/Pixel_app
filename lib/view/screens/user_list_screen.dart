import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_app/view/screens/details_screen.dart';
import 'package:pixel_app/view/utils/color_theme/colors.dart';
import 'package:pixel_app/view/utils/constants/app_text.dart';
import 'package:pixel_app/view/utils/constants/navigations.dart';
import 'package:pixel_app/view/utils/constants/paths.dart';

import '../../bloc/user_bloc/user_bloc.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserSuccessState) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    PageNavigations().push(DetailsScreen(
                        index: index,
                        id: state.list[index].dataId,
                        name: state.list[index].name,
                        panNumber: state.list[index].panCardNumber,
                        phone: state.list[index].mobileNumber,
                        address: '',
                        postCode:
                            'state.list[index].addressModelList[index].postCode',
                        state:
                            'state.list[index].addressModelList[index].state',
                        city:
                            'state.list[index].addressModelList[index].city'));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.dividerColor,
                      child: CustomText(
                          text: index.toString(),
                          fontFamily: CustomFonts.poppings,
                          size: 0.04,
                          color: AppColors.blackColor),
                    ),
                    title: CustomText(
                        text: state.list[index].name,
                        fontFamily: CustomFonts.poppings,
                        size: 0.04,
                        color: AppColors.blackColor),
                    subtitle: CustomText(
                        text: state.list[index].panCardNumber,
                        fontFamily: CustomFonts.poppings,
                        size: 0.03,
                        color: AppColors.blackColor),
                    trailing: IconButton(
                        onPressed: () {
                          showMenu(
                            context: context,
                            position:
                                const RelativeRect.fromLTRB(100, 40, 10, 20),
                            items: [
                              const PopupMenuItem(
                                value: 'edit',
                                child: Text('Edit'),
                              ),
                              const PopupMenuItem(
                                value: 'delete',
                                child: Text('Delete'),
                              ),
                            ],
                          ).then((value) {
                            // Handle the selected option
                            if (value == 'edit') {
                              print('Edit option selected');
                              // Add your edit logic here
                            } else if (value == 'delete') {
                              print('Delete option selected');
                              // Add your delete logic here
                            }
                          });
                        },
                        icon: const Icon(Icons.menu)),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
