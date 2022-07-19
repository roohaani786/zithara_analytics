// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_screen_route.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrackScreenRouteModelAdapter extends TypeAdapter<TrackScreenRouteModel> {
  @override
  final int typeId = 0;

  @override
  TrackScreenRouteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrackScreenRouteModel(
      route: fields[0] as String?,
      loggedDuration: fields[1] as DateTime?,
      message: fields[2] as String?,
      status: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TrackScreenRouteModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.route)
      ..writeByte(1)
      ..write(obj.loggedDuration)
      ..writeByte(2)
      ..write(obj.message)
      ..writeByte(3)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrackScreenRouteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
