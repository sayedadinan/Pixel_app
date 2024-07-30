// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';
import 'package:pixel_app/data/model/address_model.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class MusicSong extends HiveObject {
  @HiveField(0)
  int dataId;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  String mobileNumber;
  @HiveField(4)
  String panCardNumber;
  @HiveField(5)
  List<AddressModel> addressModelList;

  MusicSong(
      {required this.name,
      required this.email,
      required this.dataId,
      required this.mobileNumber,
      required this.panCardNumber,
      required this.addressModelList});
}
