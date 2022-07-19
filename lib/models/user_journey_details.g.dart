// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_journey_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserJourneyDetailsModelAdapter
    extends TypeAdapter<UserJourneyDetailsModel> {
  @override
  final int typeId = 1;

  @override
  UserJourneyDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserJourneyDetailsModel(
      journeyName: fields[0] as String?,
      userJourneyScreens: (fields[1] as List?)?.cast<TrackScreenRouteModel>(),
      message: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserJourneyDetailsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.journeyName)
      ..writeByte(1)
      ..write(obj.userJourneyScreens)
      ..writeByte(2)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserJourneyDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
