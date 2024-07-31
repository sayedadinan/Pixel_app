import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_app/bloc/address_bloc/bloc/address_bloc.dart';
import 'package:pixel_app/bloc/autofile_bloc/bloc/auto_fill_bloc.dart';
import 'package:pixel_app/data/model/address_model.dart';

class DataAddingButton extends StatelessWidget {
  final List<AddressTable> addressList;
  final int index;
  final AddressState state;
  const DataAddingButton({
    super.key,
    required this.index,
    required this.state, required this.addressList,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
            onTap: () {
              print(BlocProvider.of<AutoFillBloc>(context).state.city[index]);
              if (state.addressControllers[index].text.isNotEmpty &&
                  state.postcodeControllers[index].text.isNotEmpty) {
                addressList.add(AddressTable(
                    address: state.addressControllers[index].text,
                    postCode: state.postcodeControllers[index].text,
                    state: BlocProvider.of<AutoFillBloc>(context)
                        .state
                        .state[index],
                    city: BlocProvider.of<AutoFillBloc>(context)
                        .state
                        .city[index]));
              }
              for (int i = 0; i < addressList.length; i++) {
                print(addressList[i].address);
                print(addressList[i].postCode);
              }
            },
            child: const Icon(Icons.done))
      ],
    );
  }
}
