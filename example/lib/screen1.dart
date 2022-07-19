import 'package:example/screen2.dart';
import 'package:flutter/material.dart';
import 'package:zithara_analytics/helpers/zi_navigation_helper.dart';
import 'package:zithara_analytics/services/zi_analytics_service.dart';

class Screen1 extends StatefulWidget{
  static const String routeName = "Screen1";
  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with RouteAware {
  @override
  // void initState() {
  //   ZiAnalyticsService.logUserClickScreen(Screen1.routeName,DateTime.now());
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(Screen1.routeName),),
      body: Column(children:
      [
        Text("Wait for some duration and then navigate to Screen 2"),
        TextButton(onPressed: (){
          ZiNavigationHelper.navigateWithNamedRoutes(Screen2.routeName, context);
        }, child: Text(Screen2.routeName))
      ]),
    );
  }
}