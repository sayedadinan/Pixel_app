import 'package:pixel_app/data/model/address_model.dart';
import 'package:pixel_app/view/widgets/adding_button.dart';
import 'package:pixel_app/view/widgets/address_field.dart';
import 'package:pixel_app/view/widgets/city_display_container.dart';
import 'package:pixel_app/view/widgets/city_state_container.dart';
import 'package:pixel_app/view/widgets/postcode_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_app/bloc/address_bloc/bloc/address_bloc.dart';
import 'package:pixel_app/view/utils/constants/sizedbox.dart';

class AddressSection extends StatelessWidget {
  final List<AddressTable> addressList;
  const AddressSection({
    super.key, required this.addressList,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.itemCount,
          itemBuilder: (context, index) {
            return Column(
              children: [
                AddressField(
                  state: state,
                  index: index,
                ),
                const CustomSizedBoxHeight(height: 0.02),
                PostCodeField(
                  index: index,
                  state: state,
                ),
                const CustomSizedBoxHeight(height: 0.02),
                Row(children: [
                  PostAutoContainer(index: index),
                  const CustomSizedBoxWidth(0.01),
                  CityDisplayContainer(index: index)
                ]),
                const CustomSizedBoxHeight(height: 0.01),
                DataAddingButton(
                  addressList: addressList,
                  index: index,
                  state: state,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
