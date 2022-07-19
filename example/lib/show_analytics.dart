import 'package:example/cubit/logscreencubit/log_screen_cubit.dart';
import 'package:example/log_screen.dart';
import 'package:example/widgets/zi_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zithara_analytics/models/track_screen_route.dart';
import 'package:zithara_analytics/models/user_journey_details.dart';
import 'package:zithara_analytics/services/zi_analytics_service.dart';
import 'package:zithara_analytics/storage/zi_database.dart';
import 'package:zithara_analytics/zi_analytics.dart';

class ShowAnalytics extends StatefulWidget{
  static const String routeName = "ShowAnalytics";
  @override
  State<ShowAnalytics> createState() => _ShowAnalyticsState();
}

class _ShowAnalyticsState extends State<ShowAnalytics>  {

  TrackScreenRouteModel data = TrackScreenRouteModel(status: 200);
  var appSessionData;
  UserJourneyDetailsModel userJourneyData = UserJourneyDetailsModel();
  double height = 0;
  double width = 0;

  getLogScreenDetails(String routeName) async{
    data = await ZiAnalyticsService.getUserClickScreenLog(routeName);
    print(data);
    setState(() {
    });
  }

  getJourneyDetails(String routeName) async{
    userJourneyData = await ZiAnalyticsService.getUserJourney(routeName);
    print(userJourneyData.userJourneyScreens);
    setState(() {
    });
  }

  getAppSessionDetails()async {
    appSessionData = await ZiDatabase.getAppSession();
  }

  @override
  void initState() {
    getLogScreenDetails(LogScreen.routeName);
    getJourneyDetails("MyJourney");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Show Analytics",style: TextStyle(color: Colors.green),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.green,)),
        backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.0,),
            Text("Dashboard",style: TextStyle(fontSize: 25.0),),
            SizedBox(height: 20.0,),
            ZiContainer(
              height: height * 0.60,
              width: width * 0.95,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Overview",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.blue
                        ),),

                        ZiContainer(
                          borderColor: Colors.grey,
                          padding: 5.0,
                          child: Row(
                            children: [
                              Text("All Time",style: TextStyle(
                                  fontSize: 12.0
                              ),),
                            ],
                          ),
                        ),
                    ],),
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ZiContainer(
                            width: width * 0.25,
                              child: Column(
                            children: [
                              Text("Visits",style: TextStyle(color: Colors.teal),),
                              Text(ZiAnalytics.visitCount.toString())
                            ],
                          )),
                          ZiContainer(
                             width: width * 0.45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("LOG SCREEN ANALYTICS",
                                style: TextStyle(color: Colors.teal),),
                                SizedBox(height: 10,),
                                Text((data.status == 201)?"Message: ${data.message}\nStatus:${data.status}\nTimestamp: ${data.loggedDuration} seconds":
                                "Screen Log Failed || ${data.message}",
                                style: TextStyle(fontSize: 12.0),),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    ZiContainer(
                      // width: width * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("USER JOURNEY ANALYTICS",
                            style: TextStyle(color: Colors.teal),),
                          SizedBox(height: 10,),
                            ZiContainer(
                              height: 50.0,
                              width: double.infinity,
                              child: (userJourneyData.userJourneyScreens!= null)?ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: userJourneyData.userJourneyScreens!.length,
                                  itemBuilder: (context,i){
                                  print((userJourneyData.userJourneyScreens!.length));
                                  if(
                                  userJourneyData.userJourneyScreens![i].route!= null)
                                  return (i == (userJourneyData.userJourneyScreens!.length))?
                                  Text("${userJourneyData.userJourneyScreens![i].route}"):Text("${userJourneyData.userJourneyScreens![i].route}--->",
                                    style: TextStyle(fontSize: 12.0),);
                                  else
                                    return SizedBox();

                              }): SizedBox(),
                            )


                        ],
                      ),
                    ),
                    SizedBox(height: 20.0,),

                    Text("User Retention"),
                    ZiContainer(child: Row(children: [
                      Icon(Icons.download),
                      Column(children: [
                        Row(

                          children: [
                          Text("User retention"),
                          Text("74.5%")
                        ],),

                      ],)
                    ],))
                    // ZiContainer(child: Column(
                    //   children: [
                    //     Text(appSessionData[0]),
                    //     Text(appSessionData[1])
                    //   ],
                    // ))
                  ],
                ),
              )),

          ],
        ),
      ),
    );
  }
}