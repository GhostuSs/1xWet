// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'days_month.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WaterDaysInMonthAdapter extends TypeAdapter<WaterDaysInMonth> {
  @override
  final int typeId = 8;

  @override
  WaterDaysInMonth read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WaterDaysInMonth(
      data: (fields[0] as List?)?.cast<WaterDay>(),
    );
  }

  @override
  void write(BinaryWriter writer, WaterDaysInMonth obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WaterDaysInMonthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
