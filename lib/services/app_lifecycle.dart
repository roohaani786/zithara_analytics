import 'dart:developer';

import 'package:flutter/material.dart';

import '../zi_analytics.dart';
typedef FutureVoidCallback = void Function(Future);

class LifecycleEventHandler extends WidgetsBindingObserver {
  LifecycleEventHandler();


//  @override
//  Future<bool> didPopRoute()

//  @override
//  void didHaveMemoryPressure()

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        await ZiAnalytics.endAppSession();
        print("Ended");
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.resumed:
        print("Visible");
        break;
    }
    log('''
=============================================================
               $state
=============================================================
''');
  }

//  @override
//  void didChangeLocale(Locale locale)

//  @override
//  void didChangeTextScaleFactor()

//  @override
//  void didChangeMetrics();

//  @override
//  Future<bool> didPushRoute(String route)
}