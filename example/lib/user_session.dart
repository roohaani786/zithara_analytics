import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zithara_analytics/zi_analytics.dart';

class UserSession extends StatefulWidget{
  static const String routeName = "UserSession";
  @override
  State<UserSession> createState() => _UserSessionState();
}

class _UserSessionState extends State<UserSession> {

  @override
  void initState() {
    ZiAnalytics.startAppSession();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
          child: TextButton(onPressed: (){
            SystemNavigator.pop(animated: true);
          },child: Text("Press to end session")),
        ),
    );
  }
}