import 'package:flutter/material.dart';
import 'package:pixel_app/bloc/address_bloc/bloc/address_bloc.dart';
import 'package:pixel_app/view/utils/constants/app_textfield.dart';

class AddressField extends StatelessWidget {
  final AddressState state;
  final int index;
  const AddressField({
    super.key,
    required this.state,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Inputfield(
        controller: state.addressControllers[index],
        hinttext: 'Address',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'please enter a address';
          }
          return null;
        });
  }
}