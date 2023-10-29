// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DietModelAdapter extends TypeAdapter<DietModel> {
  @override
  final int typeId = 1;

  @override
  DietModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DietModel(
      name: fields[0] as String,
      iconPath: fields[1] as String,
      duration: fields[2] as String,
      calorie: fields[4] as String,
      level: fields[3] as String,
      isViewSelected: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DietModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.iconPath)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.level)
      ..writeByte(4)
      ..write(obj.calorie)
      ..writeByte(5)
      ..write(obj.isViewSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DietModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
