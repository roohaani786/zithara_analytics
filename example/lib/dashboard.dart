import 'package:example/screen1.dart';
import 'package:example/show_analytics.dart';
import 'package:example/user_session.dart';
import 'package:example/widgets/zi_box.dart';
import 'package:flutter/material.dart';
import 'package:zithara_analytics/services/zi_analytics_service.dart';
import 'package:zithara_analytics/zi_analytics.dart';
import 'package:zithara_analytics/helpers/zi_navigation_helper.dart';

import 'log_screen.dart';

class Dashboard extends StatefulWidget {
  bool? endJourney;
  static const String routeName = "Dashboard";
  Dashboard({Key? key,this.endJourney}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  List<String> labelList = ["Log Screen","Log User Journey","Log User Session","Show Analytics",
    "Configure Analytics","Log Widgets","Log Taps","Log Scrolls",
    "HeatMaps"
  ];
  List<String> assetsList = ["assets/svgs/log_screen.svg","assets/svgs/user_journey.svg","assets/svgs/user_session.svg",
    "assets/svgs/show_analytics.svg","assets/svgs/configure.svg","assets/svgs/methods.svg",
    "assets/svgs/tap.svg","assets/svgs/scrolls.svg","assets/svgs/feedback.svg"
  ];

  stopJourney() async {
    await ZiAnalyticsService.logUserJourney("MyJourney");
  }
  @override
  void initState() {
    ZiAnalytics.initValues();
    if(widget.endJourney != null){
      stopJourney();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 180,
        ),
            padding: EdgeInsets.only(top: 200.0),
            scrollDirection: Axis.vertical,
            itemCount: 9,itemBuilder: (context,index){
          return InkWell(
            onTap: (){
              if(labelList[index] == "Log Screen"){
                ZiNavigationHelper.navigateNormally(screenClass: LogScreen(), screenName: LogScreen.routeName, context: context);
              }
              else if(labelList[index] == "Show Analytics"){
                ZiNavigationHelper.navigateNormally(screenClass: ShowAnalytics(),screenName: ShowAnalytics.routeName,context: context);
              }
              else if(labelList[index] == "Log User Journey"){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Screen1();
                },settings: RouteSettings(name: Screen1.routeName)),);
              }
              else if(labelList[index] == "Log User Session"){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return UserSession();
                },settings: RouteSettings(name: UserSession.routeName)),);
              }
            },
              child: ziBox(label: labelList[index],specifiedAsset: assetsList[index]));
        }),
      ),
    );
  }
}