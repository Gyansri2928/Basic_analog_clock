import 'package:alarm_clock/ap/style.dart';
import 'package:alarm_clock/utils/time_model.dart';
import 'package:alarm_clock/widget/clock_widget.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
                var currentTime = DateTime.now();
                String seconds = currentTime.second < 10
                    ? "0${currentTime.second}"
                    : "${currentTime.second}";
                String minutes = currentTime.minute < 10
                    ? "0${currentTime.minute}"
                    : "${currentTime.minute}";
                String hours = currentTime.hour < 10
                    ? "0${currentTime.hour}"
                    : "${currentTime.hour}";
                String xyz =currentTime.hour < 12
                    ? "AM"
                    : "PM";

                return Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Today",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 28),),
                          Text(
                            "$hours:$minutes:$seconds $xyz",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ClockWidget(TimeModel(currentTime.hour,
                          currentTime.minute, currentTime.second)),
                    ),
                  ],
                );
              }
              ),
              SizedBox(
                height: 60.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Select another Time Zone",style: TextStyle(fontSize: 18),),
                  Divider(
                    color: Colors.black45,
                  ),
                  SizedBox(
                    height: 15,
                  )

                ],
              ),
              Expanded(child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/1.19,
                    height: 100,
                    margin: EdgeInsets.only(right: 24),
                    padding:EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Appstyle.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0,left: 5),
                              child: Text("Bei Jin",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: Colors.white,
                                fontSize: 30
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0,right: 5),
                              child: Text("${DateTime.now().hour}:${DateTime.now().minute}",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: Colors.white,
                                fontSize: 30
                              ),),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("Today",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontSize: 28
                          ),),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.19,
                    height: 100,
                    padding:EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Appstyle.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0,left: 5),
                              child: Text("Bei Jin",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: Colors.white,
                                  fontSize: 30
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0,right: 5),
                              child: Text("${DateTime.now().hour}:${DateTime.now().minute}",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: Colors.white,
                                  fontSize: 30
                              ),),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("Today",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                              fontSize: 28
                          ),),
                        )
                      ],
                    ),
                  )

                ],
              )),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Appstyle.primaryColor,
        unselectedItemColor: Colors.black45,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.watch_later),label: "Clock"),
          BottomNavigationBarItem(icon: Icon(Icons.alarm),label: "Alarm"),
          BottomNavigationBarItem(icon: Icon(Icons.timer),label: "StopWatch"),
          BottomNavigationBarItem(icon: Icon(Icons.timelapse_outlined),label: "TimeLapse"),

        ],
      ),
    );
  }
}
