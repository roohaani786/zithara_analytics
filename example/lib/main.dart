import 'package:example/router.dart';
import 'package:flutter/material.dart';
import 'package:zithara_analytics/helpers/zi_navigation_helper.dart';
import 'package:zithara_analytics/zi_analytics_observer.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'dashboard.dart';

void main({String? env}) async {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 final AppRouter _approute = AppRouter();

  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      title: 'Zithara',
      themeMode: ThemeMode.light,
      navigatorObservers: [ZitharaRouteObserver()],
      debugShowCheckedModeBanner: false,
      initialRoute: Dashboard.routeName,
      onGenerateRoute: _approute.onGenerateRoute,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
    );
  }
}
