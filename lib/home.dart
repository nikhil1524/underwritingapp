import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insurance_underwriting/myAppBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeScreenWidget();
  }
}

class HomeScreenWidget extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Underwriting"),
        elevation: 0.4,
      ),
      body: Stack( fit:StackFit.expand, children: <Widget>[
        Container(


        ),





      ],



      ) ,

    );
  }
}