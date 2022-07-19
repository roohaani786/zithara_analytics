import 'dart:convert';
import 'package:hive_flutter/adapters.dart';
import 'package:zithara_analytics/models/track_screen_route.dart';
part 'user_journey_details.g.dart';

UserJourneyDetailsModel trackBackFromJson(String str) => UserJourneyDetailsModel.fromJson(json.decode(str).map((x) => UserJourneyDetailsModel.fromJson(x)));


@HiveType(typeId: 1)
class UserJourneyDetailsModel {
  UserJourneyDetailsModel({
    this.journeyName,
    this.userJourneyScreens,
    this.message,
  }
  );

  @HiveField(0)
  String? journeyName;
  @HiveField(1)
  List<TrackScreenRouteModel>? userJourneyScreens;
  @HiveField(2)
  String? message;

  factory UserJourneyDetailsModel.fromJson(Map<String, dynamic> json) => UserJourneyDetailsModel(
    journeyName: json["journeyName"] ?? "",
    userJourneyScreens:  json["userJourneyScreens"] ?? "",
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "journeyName": journeyName,
    "userJourneyScreens": userJourneyScreens,
    "message": message,
  };
}
