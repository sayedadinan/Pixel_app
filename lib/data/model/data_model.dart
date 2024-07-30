// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';
import 'package:pixel_app/data/model/address_model.dart';
part 'data_model.g.dart';

@HiveType(typeId: 0)
class PanDatas extends HiveObject {
  @HiveField(0)
  String dataId;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  String mobileNumber;
  @HiveField(4)
  String panCardNumber;
  @HiveField(5)
  List<AddressTable> addressModelList;

  PanDatas(
      {required this.name,
      required this.email,
      required this.dataId,
      required this.mobileNumber,
      required this.panCardNumber,
      required this.addressModelList});

  @override
  String toString() {
    return "ID: $dataId name: $name email: $email addressTable $addressModelList";
  }
}
