import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:insurance_underwriting/menu/menu.dart';

Map portfolioMap;
Map tempPortfolioData;
Map totalPortfolioStats;

//void main() => runApp(MyApp());
Future<Null> getDataFromServer() async {
  Future<String> loadData() async {
    var response = await rootBundle.loadString('assets/data/portfolio.json');
    tempPortfolioData = new JsonDecoder().convert(response);
  }
  Future<Null> _pullData() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://github.com/nikhil1524/underwritingapp/blob/master/lib/portfolio.json"),
        headers: {"Accept": "application/json"});
    tempPortfolioData = new JsonDecoder().convert(response.body);
  }

  List<Future> futures = [];
  futures.add(loadData());

  await Future.wait(futures);
}

void main() async {
  await getDataFromServer();
  await getApplicationDocumentsDirectory().then((Directory directory) async {
    print(directory.path);
    File jsonFile = new File(directory.path + "/portfolio.json");

    jsonFile.writeAsStringSync(json.encode(tempPortfolioData));

    if (jsonFile.existsSync()) {
      portfolioMap = json.decode(jsonFile.readAsStringSync());
    } else {
      jsonFile.createSync();
      jsonFile.writeAsStringSync("{}");
      portfolioMap = {};
    }
    if (portfolioMap == null) {
      portfolioMap = {};
    }
  });
  runApp(MyApp());
}

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
                        backgroundColor: Colors.transparent,
                        radius: 50.0,
                        child: Image.asset('assets/images/logo.png')),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text("Pension",
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
