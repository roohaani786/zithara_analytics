import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../models/track_screen_route.dart';
import '../models/user_journey_details.dart';
import 'package:path_provider/path_provider.dart';

class ZiDatabase {

  static String backBoxKey = "backBoxKey";
  static String screenBoxKey = "screenBoxKey";
  static String userJourneyBoxKey = "userJourneyBoxKey";
  static String userSessionBoxKey = "userSessionBoxKey";
  static Box<dynamic>? backBox;
  static Box<dynamic>? screenBox;
  static Box<dynamic>? userJourneyBox;
  static Box<dynamic>? userSessionBox;
  static List<UserJourneyDetailsModel> userJourneyList = List.empty(growable: true);
  static List<TrackScreenRouteModel> screenRouteList = List.empty(growable: true);

  // Initialize Hive storage and encrypt data
  static Future initHiveStorage() async {
    WidgetsFlutterBinding.ensureInitialized();
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(BackLogAdapter());
      Hive.registerAdapter(UserJourneyAdapter());
    }
    backBox = await Hive.openBox('backRouteBox');
    screenBox = await Hive.openBox('screenRouteBox');
    userJourneyBox = await Hive.openBox('userJourneyBox');
    userSessionBox = await Hive.openBox('userSessionBox');

  }

  static Future clearHiveValues() async {
    screenRouteList = List.empty(growable: true);
  }

  static Future deleteHiveStorage() async {
    if(backBox != null){
      backBox!.deleteFromDisk();
    }
    if(screenBox !=null){
      screenBox!.deleteFromDisk();
    }
    if(userJourneyBox !=null){
      userJourneyBox!.deleteFromDisk();
    }
  }

  static Future saveAppSession({required Duration duration, required int visitCount}) async {
    List <String> data = [duration.toString(),visitCount.toString(),
    ];
    userSessionBox!.put(userSessionBoxKey, data);
  }

  static Future <List<String>> getAppSession() async {

    var data = await userSessionBox!.get(userSessionBoxKey) ?? [""];
    return data;
  }


  // Save routeName & userStay duration when pressed on any Screen

  static Future <TrackScreenRouteModel> saveUserClickScreenRoute(String route, DateTime loggedDuration) async {

    screenRouteList.add(TrackScreenRouteModel(route: route,loggedDuration: loggedDuration,message: "",status: 201));
    try {
      screenBox!.put(screenBoxKey, screenRouteList);
      log("Route saved successfully!");
      screenRouteList.last.message = "Route saved successfully!";
      screenRouteList.last.status = 201;
      List<TrackScreenRouteModel> result = screenBox!.get(screenBoxKey);
      log("User journey path is :");
      for(int i=0;i<result.length;i++){
        log(" --> ${result[i].route}\t");
      }
      return screenRouteList.last;
    } catch (e) {
      log("$e");
      log("Exception $e!");
      screenRouteList.last.message = "Exception $e!";
      screenRouteList.last.status = 405;
      return screenRouteList.last;
    }
  }

  static Future <TrackScreenRouteModel> getUserClickScreenRoute(String route) async {
    List<TrackScreenRouteModel> result = List.empty(growable: true);
    TrackScreenRouteModel data = TrackScreenRouteModel(status: 200);
    try {
      result = screenBox!.get(screenBoxKey);
      log("User click screen details are:-");
      for(int i=0;i<result.length;i++){
        if(result[i].route!.contains(route)){
          log(" --> ${result[i].route}\t");
          data = result[i];
        }
      }
      data.status = 201;
      return data;
    } catch (e) {
      log("$e");
      log("Exception $e!");
      data.message = "Exception $e!";
      data.status = 405;
      return data;
    }
  }

  // Save routeName & userStay duration when pressed on backButton

  static Future <TrackScreenRouteModel> saveBackRoute(String route, DateTime loggedDuration) async {

    List<TrackScreenRouteModel> routeList = List.empty(growable: true);
    routeList.add(TrackScreenRouteModel(route: route,loggedDuration: loggedDuration,message: "",
    status: 201));
    try {
      backBox!.put(backBoxKey, routeList);
      log("Back Route saved successfully!");
      routeList.last.message = "Back Route saved successfully!";
      List<TrackScreenRouteModel> result = backBox!.get(backBoxKey);
      log("User spent time in seconds:");
      log(result.last.loggedDuration!.second.toString());
      return routeList.last;
    } catch (e) {
      log("$e");
      log("Exception $e!");
      routeList.last.message = "Exception $e!";
      return routeList.last;
    }
  }

  // Fetches and saves userJourney logged on tapping the back button

  static Future<UserJourneyDetailsModel> saveUserJourney (String journeyName,List<TrackScreenRouteModel> routeDetails) async{
    try {
      userJourneyBox!.put(userJourneyBoxKey, routeDetails);
      log("User Journey saved successfully!");
      // userJourneyList.last.message = "Back Route saved successfully!";
      routeDetails.add(TrackScreenRouteModel(message: "User Journey saved successfully!",
      status: 201));
      for(int i =0;i< routeDetails.length;i++){
        debugPrint(routeDetails[i].route);
        debugPrint(routeDetails[i].loggedDuration.toString());
      }
      userJourneyList.add(UserJourneyDetailsModel(journeyName: journeyName, userJourneyScreens: routeDetails, message: "success"));
      // List<TrackBackRoute> result = userJourneyBox!.get(userJourneyBoxKey);
      // log("User spent time in seconds:");
      // log(result.last.route);
      screenRouteList = List.empty(growable: true);
      return userJourneyList.last;
    } catch (e) {
      log("Exception $e!");
      userJourneyList.last.message = "Exception $e!";
      return userJourneyList.last;
    }
  }

  static Future<UserJourneyDetailsModel> getUserJourney (String journeyName) async{
    List<TrackScreenRouteModel> routeDetails = List.empty(growable: true);
    UserJourneyDetailsModel journeyData = UserJourneyDetailsModel();

    try {
      routeDetails = userJourneyBox!.get(userJourneyBoxKey);
      log("User Journey fetched successfully!");
      journeyData = UserJourneyDetailsModel(journeyName: journeyName, userJourneyScreens: routeDetails, message: "success");

      return journeyData;
    } catch (e) {
      log("Exception $e!");
      journeyData.message = "Exception $e!";
      return journeyData;
    }
  }
}


// Can be generated automatically
class BackLogAdapter extends TypeAdapter<TrackScreenRouteModel> {
  @override
  final typeId = 0;

  @override
  TrackScreenRouteModel read(BinaryReader reader) {
    return TrackScreenRouteModel(status: 200);
  }

  @override
  void write(BinaryWriter writer, TrackScreenRouteModel obj) {
    writer.write(obj.route);
    writer.write(obj.loggedDuration);
  }
}

class UserJourneyAdapter extends TypeAdapter<UserJourneyDetailsModel> {
  @override
  final typeId = 1;

  @override
  UserJourneyDetailsModel read(BinaryReader reader) {
    return UserJourneyDetailsModel();
  }

  @override
  void write(BinaryWriter writer, UserJourneyDetailsModel obj) {
    writer.write(obj.journeyName);
    writer.write(obj.userJourneyScreens);
  }
}
