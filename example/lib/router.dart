import 'dart:developer';
import 'package:example/dashboard.dart';
import 'package:example/log_screen.dart';
import 'package:example/screen1.dart';
import 'package:example/screen2.dart';
import 'package:example/screen3.dart';
import 'package:example/screen4.dart';
import 'package:example/show_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Route? onGenerateRoute(RouteSettings settings) {
    log('Route: ${settings.name}');
    switch (settings.name) {

      case LogScreen.routeName:
        return MaterialPageRoute(
            builder: (_) =>  ShowAnalytics(),settings: RouteSettings(name: ShowAnalytics.routeName));
      case LogScreen.routeName:
        return MaterialPageRoute(
            builder: (_) =>  LogScreen(),settings: RouteSettings(name: LogScreen.routeName));
      case Screen1.routeName:
        return MaterialPageRoute(
            builder: (_) =>  Screen1(),settings: RouteSettings(name: Screen1.routeName));
      case Screen2.routeName:
        return MaterialPageRoute(
            builder: (_) =>  Screen2(),settings: RouteSettings(name: Screen2.routeName));
      case Screen3.routeName:
        return MaterialPageRoute(
            builder: (_) =>  Screen3(),settings: RouteSettings(name: Screen3.routeName));
      case Screen4.routeName:
        return MaterialPageRoute(
            builder: (_) =>  Screen4(),settings: RouteSettings(name: Screen4.routeName));

      default:
        return MaterialPageRoute(builder: (_) => Dashboard(),settings: RouteSettings(name: Dashboard.routeName,));
    }
  }
}
