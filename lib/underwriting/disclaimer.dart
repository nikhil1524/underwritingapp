import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insurance_underwriting/underwriting/underwriting.dart';

final String disclaimer =
    "I accept that our company will handle personal data\n"
    "given by me and may check my medical history. Our\n"
    "company handles and may disclose data in accordance\n"
    "with legislation governing the handling of personal\n"
    "data and makes sure all personal data is handled \n"
    "bank secrecy. Personal data is handled in order to\n"
    "provide services and for the purposes of the bank\n"
    "operations and risk management.\n"
    "Data is collected from the customer, from registers \n"
    "maintained by the authorities, from credit information \n"
    "and payment default registers and from other reliable\n"
    "sources. Company also uses its customer register for \n"
    "direct marketing to its customers.Customers are entit-\n"
    "led to forbid direct marketing.\n"
    "Read more about our company privacy policy.";
bool isChecked = false;

class DisclaimerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new DisclaimerScreenWidged();
  }
}

class DisclaimerScreenWidged extends State<DisclaimerScreen> {
  get selecisCheckedted => false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        /*appBar: AppBar(
          title: Text("Underwriting"),
          elevation: 0.4,
        ),*/
        body: Stack(fit: StackFit.expand, children: <Widget>[
      Container(decoration: BoxDecoration(color: Colors.white10)),
      Column(
        children: <Widget>[
          Expanded(flex: 3, child: Column()),
          Expanded(
              flex: 4,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Checkbox(
                                    value: isChecked,
                                    activeColor: Colors.blue,
                                    onChanged: (state) {
                                      setState(() {
                                        isChecked = state;
                                      });
                                      onChangeCheckBox(state);
                                    })
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[Text(disclaimer)])
                        ]),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      padding: EdgeInsets.only(
                          top: 4.0, bottom: 4.0, right: 10.0, left: 10.0),
                      child: FloatingActionButton.extended(
                          onPressed: !isChecked
                              ? null
                              : () {
                                  buttonPressed();
                                },
                          key: Key("buttonKey"),
                          label: Text('Approve'),
                          icon: Icon(Icons.thumb_up),
                          backgroundColor: Colors.pink),
                    ),
                  ]))
        ],
      )
    ]));
  }

  buttonPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UnderwritingScreen()));
  }

  buttonActive() {
  }

  onChangeCheckBox(bool state) {
    buttonActive();
  }
}
