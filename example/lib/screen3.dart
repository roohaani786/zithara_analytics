import 'package:example/screen4.dart';
import 'package:flutter/material.dart';
import 'package:zithara_analytics/helpers/zi_navigation_helper.dart';

class Screen3 extends StatefulWidget{
  static const String routeName = "Screen3";
  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> with RouteAware {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(Screen3.routeName),),
      body: Column(children:
      [
        Text("Wait for some duration and then navigate to Screen 2"),
        TextButton(onPressed: (){
          ZiNavigationHelper.navigateWithNamedRoutes(Screen4.routeName, context);;
        }, child: Text(Screen4.routeName))
      ]),
    );
  }
}