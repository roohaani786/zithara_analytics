library zithara_analytics;
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:zithara_analytics/services/app_lifecycle.dart';
import 'package:zithara_analytics/storage/zi_database.dart';

class ZiAnalytics {


  static int visitCount = 0;
  static DateTime logDate = DateTime.now();

  // create an instance of ZiService

  static Future initValues() async{
    WidgetsBinding.instance.addObserver(LifecycleEventHandler());
    await ZiDatabase.initHiveStorage();
   // Get.to(page)
  }

  static Future deInitValues() async{
    await ZiDatabase.deleteHiveStorage();
  }

  static Future setUser() async{
    await ZiDatabase.deleteHiveStorage();
  }

  static Future unSetUser() async{
    await ZiDatabase.deleteHiveStorage();
  }

  static Future startAppSession() async{
    ZiAnalytics.visitCount++;
    log("Target Platform is ${Platform.operatingSystem}");
    ZiAnalytics.logDate = DateTime.now();
    log("Entered logDate is ${ZiAnalytics.logDate}");
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appVersion =  await packageInfo.version;
    log("App Version is $appVersion");
    log("Logged startAppSession");
    // await ZiDatabase.deleteHiveStorage();
  }

  static Future endAppSession() async{
    log("Exit logDate is ${DateTime.now()}");
    log("Last loggedDate is ${ZiAnalytics.logDate}");
    log("Logged endAppSession");
    var date = DateTime.now();
    log("App session duration is ${date.difference(ZiAnalytics.logDate)} and no of visits are: ${ZiAnalytics.visitCount}");
    await ZiDatabase.saveAppSession(duration: date.difference(ZiAnalytics.logDate) , visitCount: ZiAnalytics.visitCount);
  }

  static Future createNewEvent() async{
    await ZiDatabase.deleteHiveStorage();
  }

  static Future changeEventName() async{
    await ZiDatabase.deleteHiveStorage();
  }

  static Future getScreenViews() async{
    await ZiDatabase.deleteHiveStorage();
  }

  static Future getUserRetention() async{
    await ZiDatabase.deleteHiveStorage();
  }

  static Future getChurnedUsers() async{
    await ZiDatabase.deleteHiveStorage();
  }

  static generateUserOnBoardingJourney () {
    getOnBoardingBehaviourData();
  }

  static getOnBoardingBehaviourData() async {

  }

  static logGetStartedBehaviour() async {

  }

  static logPhoneScreenBehaviour() async {

  }

}