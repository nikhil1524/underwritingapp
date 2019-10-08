import 'package:flutter/material.dart';
import 'package:insurance_underwriting/disclaimer.dart';
import 'package:insurance_underwriting/drawerItem.dart';
import 'package:insurance_underwriting/home.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MenuScreenWidget();
  }
}

class MenuScreenWidget extends State<MenuScreen> {
  int _selectedIndex = -1;

  final drawerItems = [
    new DrawerItem("Health Declaration", Icons.assignment_ind, "main"),
    new DrawerItem("Investment", Icons.account_balance,"accountBal"),
    new DrawerItem("Logout",null ,null)
  ];


  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new DisclaimerScreen();
      case 1:
        return new MenuScreen();


      default:
        return new Text("Main Screen");
    }
  }


_onSelectItem(int index) {
  setState(() => _selectedIndex = index);
  Navigator.of(context).pop(); // close the drawer
}
  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(
          d.title,
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
        selected: i == _selectedIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(title: Text("Underwriting")),
        drawer: new Drawer(
            child: new Column(children: <Widget>[
          new UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black,
                child: Text('NN'),
              ),
              accountName: new Text(
                "Nikhil N",
                style:
                    new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              )),
          new Column(children: drawerOptions)
        ])),
        body: _getDrawerItemWidget(_selectedIndex)
    );
  }
}
