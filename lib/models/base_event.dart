import 'dart:convert';
import 'package:zithara_analytics/models/track_screen_route.dart';

BaseEventModel baseEventModelFromJson(String str) => BaseEventModel.fromJson(json.decode(str).map((x) => BaseEventModel.fromJson(x)));

class BaseEventModel {
  BaseEventModel({
    this.userJourneyScreens,
    this.message,
  });

  List<TrackScreenRouteModel>? userJourneyScreens;
  String? message;

  factory BaseEventModel.fromJson(Map<String, dynamic> json) => BaseEventModel(
    userJourneyScreens:  json["userJourneyScreens"] ?? "",
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    //  "journeyName": journeyName,
    "userJourneyScreens": userJourneyScreens,
    "message": message,
  };
}

