import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zithara_analytics/services/zi_analytics_service.dart';


class ZitharaRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  void _sendScreenView(PageRoute<dynamic> route) async {
    var screenName = route.settings.name;

    await ZiAnalyticsService.logUserClickScreen(route.settings.name!, DateTime.now());
    // do something with it, ie. send it to your analytics service collector
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    var data = route.settings.name;
    log("push ${route.navigator}");
    super.didPush(route, previousRoute);
    if (route is PageRoute)  {
      _sendScreenView(route);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _sendScreenView(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      _sendScreenView(previousRoute);
    }
  }
}