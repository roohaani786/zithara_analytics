import 'package:example/screen3.dart';
import 'package:flutter/material.dart';
import 'package:zithara_analytics/helpers/zi_navigation_helper.dart';

class Screen2 extends StatefulWidget{
  static const String routeName = "Screen2";
  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> with RouteAware {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(Screen2.routeName),),
      body: Column(children:
      [
        Text("Wait for some duration and then navigate to Screen 2"),
        TextButton(onPressed: (){
          ZiNavigationHelper.navigateWithNamedRoutes(Screen3.routeName, context);;
        }, child: Text(Screen3.routeName))
      ]),
    );
  }
}