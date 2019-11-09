import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance_underwriting/util/bloc_provider.dart';
import 'package:insurance_underwriting/util/multiling_bloc.dart';
import 'package:insurance_underwriting/util/mutiLing_global_translation.dart';

class ProfileEditPage extends StatefulWidget {
   
  @override
  State<StatefulWidget> createState() {
    return new ProfileEditState();
  }
}
String dropdownValue = 'en';
class ProfileEditState extends State<ProfileEditPage> {
  Widget build(BuildContext context) {
   final TranslationsBloc translationsBloc = BlocProvider.of<TranslationsBloc>(context); 
   
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(decoration: BoxDecoration(color: Colors.white)),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text( allTranslations.text("page.profile.language") ,
                    style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.0)),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        print(newValue);
                        translationsBloc.setNewLanguage(newValue);
                      });
                    },
                    items: <String>['en','nb']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
