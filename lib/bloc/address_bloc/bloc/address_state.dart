part of 'address_bloc.dart';

class AddressState {
  final String state;
  final String city;
  final int itemCount;
  final List<TextEditingController> addressControllers;
  final List<TextEditingController> postcodeControllers;

  AddressState({
    required this.state,
    required this.city,
    required this.itemCount,
    required this.addressControllers,
    required this.postcodeControllers,
  });

  AddressState copyWith({
    int? itemCount,
    List<TextEditingController>? addressControllers,
    List<TextEditingController>? postcodeControllers,
  }) {
    return AddressState(
      city: city,
      state: state,
      itemCount: itemCount ?? this.itemCount,
      addressControllers: addressControllers ?? this.addressControllers,
      postcodeControllers: postcodeControllers ?? this.postcodeControllers,
    );
  }
}

class AddressInitial extends AddressState {
  AddressInitial()
      : super(
          state: '',
          itemCount: 1,
          addressControllers: [TextEditingController()],
          postcodeControllers: [TextEditingController()],
          city: '',
        );
}
