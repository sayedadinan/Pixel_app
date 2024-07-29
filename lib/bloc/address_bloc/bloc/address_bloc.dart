

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(AddressInitial()) {
    on<AddMoreClicked>(_addMoreClicked);
   
  }

  Future<void> _addMoreClicked(
      AddMoreClicked event, Emitter<AddressState> emit) async {
    int newCount = state.itemCount + 1;

    // Adding a new controller for the new address and postcode
    final newAddressControllers =
        List<TextEditingController>.from(state.addressControllers)
          ..add(TextEditingController());
    final newPostcodeControllers =
        List<TextEditingController>.from(state.postcodeControllers)
          ..add(TextEditingController());

    // Emit the new state with incremented count and controllers
    emit(AddressState(
      city: '',
      state: '',
      itemCount: newCount,
      addressControllers: newAddressControllers,
      postcodeControllers: newPostcodeControllers,
    ));
  }


  @override
  Future<void> close() {
    for (final controller in state.addressControllers) {
      controller.dispose();
    }
    for (final controller in state.postcodeControllers) {
      controller.dispose();
    }
    return super.close();
  }
}
