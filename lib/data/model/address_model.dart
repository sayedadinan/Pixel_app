import 'package:hive/hive.dart';

part 'address_model.g.dart';

@HiveType(typeId: 1)
class AddressTable extends HiveObject {
  @HiveField(0)
  final String address;

  @HiveField(1)
  final dynamic postCode;

  @HiveField(2)
  final String state;

  @HiveField(3)
  final String city;

  AddressTable({
    required this.address,
    required this.postCode,
    required this.state,
    required this.city,
  });

  @override
  String toString() {
    return "Address: $address, PostCode: $postCode, State: $state, City: $city";
  }
}
