import 'package:example/cubit/logscreencubit/log_screen_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zithara_analytics/models/track_screen_route.dart';
import 'package:zithara_analytics/services/zi_analytics_service.dart';
import 'package:zithara_analytics/zi_analytics.dart';

class LogScreen extends StatefulWidget with RouteAware{
  static const String routeName = "LogScreen";
  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {

  final logScreenCubit = LogScreenCubit(LogScreenInitial());

  logScreen(DateTime startStamp) async{
    logScreenCubit.state.data = await ZiAnalyticsService.logUserClickScreen(LogScreen.routeName, startStamp);
    print(logScreenCubit.state.data.status);
    setState(() {});
  }
   DateTime startStamp = DateTime.now();

  @override
  void initState() {
   startStamp = DateTime.now();
   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: ()async {
        await logScreen(startStamp);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text(LogScreen.routeName,style: TextStyle(color: Colors.green),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.green,)),
        backgroundColor: Colors.white,),
        body: Center(
          child: Text(
         //     (logScreenCubit.state.data.status == 201)?
              "Screen logged successfully!"
                  //:
      //    "Screen Log Failed || ${logScreenCubit.state.data.message}"
          ),
        ),
      ),
    );
  }
}