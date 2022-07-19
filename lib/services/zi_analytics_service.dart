import 'dart:developer';
import '../models/track_screen_route.dart';
import '../models/user_journey_details.dart';
import '../storage/zi_database.dart';
import '../zi_analytics.dart';

class ZiAnalyticsService{

  // static trackAppOpenFrequency

  static Future<TrackScreenRouteModel> logEvent (String eventName,
      {DateTime? loggedDuration,bool? tapped,bool? scrolled,bool? hold,Map<String, Object?>? customParameters, }) async{
    log("logging user back Tap");
    //TODO: Add logging data -----
    TrackScreenRouteModel data = await ZiDatabase.saveBackRoute(eventName, DateTime.now());
    return data;
  }

  static Future<TrackScreenRouteModel> logPurchaseEvent (String eventName,
      {DateTime? loggedDuration,bool? tapped,bool? scrolled,bool? hold,Map<String, Object?>? customParameters, }) async{
    log("logging user back Tap");
    //TODO: Add logging data -----
    TrackScreenRouteModel data = await ZiDatabase.saveBackRoute(eventName, DateTime.now());
    return data;
  }

  static Future<TrackScreenRouteModel> logUserOnBack (String route, DateTime loggedDuration) async{
    log("logging user back Tap");
    TrackScreenRouteModel data = await ZiDatabase.saveBackRoute(route, loggedDuration);
    return data;
  }

  static Future<TrackScreenRouteModel> logProductVisit (String route,
      {bool? interacted, DateTime? visitDuration, bool? changedOptions}) async{
    log("logging user clicking on a class/ screen");
    //TODO: Add logging data -----
    TrackScreenRouteModel data = await ZiDatabase.saveUserClickScreenRoute(route, visitDuration!);
    return data;
  }

  static Future<TrackScreenRouteModel> logUserClickScreen (String route, DateTime startStamp,) async{
    log("logging user clicking on a class/ screen");
    var logDate = DateTime.now().difference(startStamp);
    var diffDate = DateTime(startStamp.year,startStamp.month,startStamp.day,logDate.inHours,logDate.inMinutes,
        logDate.inSeconds,logDate.inMilliseconds,logDate.inMicroseconds);
    TrackScreenRouteModel data = await ZiDatabase.saveUserClickScreenRoute(route, diffDate);
    if(data.status == 201){
      ZiAnalytics.visitCount++;
    }
    return data;
  }

  static Future<TrackScreenRouteModel> logButtonStats (String route, DateTime loggedDuration) async{
    log("logging user clicking on a class/ screen");
    TrackScreenRouteModel data = await ZiDatabase.saveUserClickScreenRoute(route, loggedDuration);
    return data;
  }

  // logs and saves specific user journey to denote the end of the journey

  static Future<UserJourneyDetailsModel> logUserJourney (String journeyName) async{
    log("saving user journey");
    UserJourneyDetailsModel data = await ZiDatabase.saveUserJourney(journeyName,ZiDatabase.screenRouteList);
    return data;
  }

  static Future<UserJourneyDetailsModel> getUserJourney (String journeyName) async{
    log("saving user journey");
    UserJourneyDetailsModel data = await ZiDatabase.getUserJourney(journeyName);
    return data;
  }


  static Future<TrackScreenRouteModel> getUserClickScreenLog (String route,) async{
    log("Getting user click screen log history");
    TrackScreenRouteModel data = await ZiDatabase.getUserClickScreenRoute(route);
    return data;
  }

}