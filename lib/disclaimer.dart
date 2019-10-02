import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insurance_underwriting/home.dart';

class DisclaimerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new DisclaimerScreenWidged();
  }
}

String disclaimer =
    "Disclaimer: I commit that i will give the details \n best to my knowledge";

class DisclaimerScreenWidged extends State<DisclaimerScreen> {
  get selected => false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Underwriting"),
          elevation: 0.4,
        ),
        body: Stack(fit: StackFit.expand, children: <Widget>[
          Container(decoration: BoxDecoration(color: Colors.blueAccent)),
          Column(
            children: <Widget>[
              Expanded(flex: 4, child: Column()),
              Expanded(
                  flex: 2,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[Checkbox(value: false, onChanged: (state){ onChangeCheckBox(state);})]),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[Text(disclaimer)])
                            ]),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          padding: EdgeInsets.only(top: 4.0, bottom: 4.0, right: 10.0, left: 10.0),
                          child: FloatingActionButton.extended(
                            onPressed: () {
                              buttonPressed();
                              },
                              key: Key("buttonKey"),
                            label: Text('Approve'),
                            icon: Icon(Icons.thumb_up),
                            backgroundColor: Colors.pink
                          ),
                        ),
                      ]))
            ],
          )
        ]));
  }

  buttonPressed() {
    print("button clicked");

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  buttonActive() {

  }

  onChangeCheckBox(bool state) {
    buttonActive();
  }
}
