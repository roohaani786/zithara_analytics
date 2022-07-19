import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
part 'track_screen_route.g.dart';


TrackScreenRouteModel trackScreenRouteModelFromJson(String str) => TrackScreenRouteModel.fromJson(json.decode(str).map((x) => TrackScreenRouteModel.fromJson(x)));

@HiveType(typeId: 0)
class TrackScreenRouteModel {
  TrackScreenRouteModel({
    this.route,
    this.loggedDuration,
    this.message,
    required this.status,
  }
      );
  @HiveField(0)
  String? route;
  @HiveField(1)
  DateTime? loggedDuration;
  @HiveField(2)
  String? message;
  @HiveField(3)
  int status;

  factory TrackScreenRouteModel.fromJson(Map<String, dynamic> json) => TrackScreenRouteModel(
    route: json["route"] ?? "",
    loggedDuration:  json["loggedDuration"] ?? "",
    message: json["message"] ?? "",
    status: json["status"] ?? 404,
  );

  Map<String, dynamic> toJson() => {
    "route": route,
    "loggedDuration": loggedDuration,
    "message": message,
    "status": status,
  };
}
