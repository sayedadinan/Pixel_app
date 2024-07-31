import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_app/bloc/address_bloc/bloc/address_bloc.dart';
import 'package:pixel_app/bloc/autofile_bloc/bloc/auto_fill_bloc.dart';
import 'package:pixel_app/bloc/validation_bloc/validation_bloc.dart';
import 'package:pixel_app/view/utils/constants/app_textfield.dart';

class PostCodeField extends StatelessWidget {
  final int index;
  final AddressState state;
  const PostCodeField({
    super.key,
    required this.index,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Inputfield(
        onChanged: (value) {
          context.read<AutoFillBloc>().add(PostValAdded(val: value!));
          return null;
        },
        controller: state.postcodeControllers[index],
        textInputFormatter: [LengthLimitingTextInputFormatter(6)],
        hinttext: 'PostCode',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'please enter a postcode';
          } else if (!isDigit(value)) {
            return 'please enter valuable';
          }
          return null;
        });
  }
}
