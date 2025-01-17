// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PanDatasAdapter extends TypeAdapter<PanDatas> {
  @override
  final int typeId = 0;

  @override
  PanDatas read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PanDatas(
      name: fields[1] as String,
      email: fields[2] as String,
      dataId: fields[0] as String,
      mobileNumber: fields[3] as String,
      panCardNumber: fields[4] as String,
      addressModelList: (fields[5] as List).cast<AddressTable>(),
    );
  }

  @override
  void write(BinaryWriter writer, PanDatas obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.dataId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.mobileNumber)
      ..writeByte(4)
      ..write(obj.panCardNumber)
      ..writeByte(5)
      ..write(obj.addressModelList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PanDatasAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
