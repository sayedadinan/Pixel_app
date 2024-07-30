// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressTableAdapter extends TypeAdapter<AddressTable> {
  @override
  final int typeId = 1;

  @override
  AddressTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressTable(
      address: fields[0] as String,
      postCode: fields[1] as dynamic,
      state: fields[2] as String,
      city: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddressTable obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.postCode)
      ..writeByte(2)
      ..write(obj.state)
      ..writeByte(3)
      ..write(obj.city);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
