// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MusicSongAdapter extends TypeAdapter<MusicSong> {
  @override
  final int typeId = 1;

  @override
  MusicSong read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MusicSong(
      name: fields[1] as String,
      email: fields[2] as String,
      dataId: fields[0] as int,
      mobileNumber: fields[3] as String,
      panCardNumber: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MusicSong obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.dataId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.mobileNumber)
      ..writeByte(4)
      ..write(obj.panCardNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicSongAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
