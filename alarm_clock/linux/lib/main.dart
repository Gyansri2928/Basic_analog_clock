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
              TimerBuilder.periodic(Duration(seconds: 1), builder: (context){
                return Column(
                  children: [
                    Center(
                      child: ClockWidget(
                          TimeModel(DateTime.now().hour,DateTime.now().minute,DateTime.now().second)
                      ),
                    )
                  ],
                );
              })
            ],
          ),

        ),
      ),
    );
  }
}

