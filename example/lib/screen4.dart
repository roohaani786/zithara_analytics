import 'package:example/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:zithara_analytics/helpers/zi_navigation_helper.dart';
import 'package:zithara_analytics/services/zi_analytics_service.dart';

class Screen4 extends StatefulWidget{
  static const String routeName = "Screen4";
  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> with RouteAware {
  @override
  void initState() {
    ZiAnalyticsService.logUserClickScreen("MyJourney",DateTime.now());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(Screen4.routeName),),
      body: Column(children:
      [
        Text("Wait for some duration and then press back button or end navigation"),
        TextButton(onPressed: () async {
          ZiNavigationHelper.navigateNormally(screenClass: Dashboard(endJourney: true,),screenName: Dashboard.routeName,context:context);
        }, child: Text("End Navigation"))
      ]),
    );
  }
}