import 'package:flutter/material.dart';

class ZiNavigationHelper {
  static navigateNormally(
      {required dynamic screenClass,
        required String screenName,
        required BuildContext context}){
    return Navigator.push(context, MaterialPageRoute(builder: (context){
      return screenClass;
    },settings: RouteSettings(name: screenName)),);
  }

  static navigateWithNamedRoutes(String routeName, BuildContext context){
    return Navigator.pushNamed(context,routeName);
  }
}