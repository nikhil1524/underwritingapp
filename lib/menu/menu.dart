import 'package:flutter/material.dart';
import 'package:insurance_underwriting/underwriting/disclaimer.dart';
import 'drawerItem.dart';
import 'package:insurance_underwriting/portfolio/dashboard.dart';

import '../main.dart';

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
    new DrawerItem("Investment", Icons.account_balance, "accountBal"),
    new DrawerItem(
        "Product Investment Returns", Icons.access_time, "productInvestment"),
    new DrawerItem("Profile", Icons.account_circle, "profile"),
    new DrawerItem("Logout", null, null)
  ];

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new DisclaimerScreen();
      default:
        return new DashboardTabs(1, _makePortfolioDisplay());
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
        appBar: AppBar(title: Text("Life And Pension")),
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
        body: _getDrawerItemWidget(_selectedIndex));
  }

  _makePortfolioDisplay() {
    print("making portfolio display");
    Map portfolioTotals = {};
    List neededPriceSymbols = [];

    portfolioMap.forEach((coin, transactions) {
      num quantityTotal = 0;
      transactions.forEach((value) {
        quantityTotal += value["quantity"];
      });
      portfolioTotals[coin] = quantityTotal;
      neededPriceSymbols.add(coin);
    });

    portfolioDisplay = [];
    num totalPortfolioValue = 0;
    num total24hChange = 0;
    num total7dChange = 0;
    portfolioDisplay.forEach((coin) {
      total24hChange += (coin["percent_change_24h"] *
          ((coin["price_usd"] * coin["total_quantity"]) / totalPortfolioValue));
      total7dChange += (coin["percent_change_7d"] *
          ((coin["price_usd"] * coin["total_quantity"]) / totalPortfolioValue));
    });

   }

}
