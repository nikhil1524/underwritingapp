import 'dart:async';

import 'package:flutter/material.dart';
import 'package:insurance_underwriting/disclaimer.dart';
import 'package:insurance_underwriting/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final String title = "Insurance UnderWriting";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        theme: ThemeData(
            bottomAppBarColor: Colors.black, primaryColor: Colors.blueAccent),
        home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MenuScreen()))
            });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.blueAccent),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.accessible,
                          color: Colors.black,
                          size: 50.0,
                        )),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text("UnderWriting",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold))
                  ],
                )),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LinearProgressIndicator(),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Text(
                    " UnderWriting Declaration",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        )
      ],
    ));
  }
}
