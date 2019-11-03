import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import '../main.dart';

class DashboardTabs extends StatefulWidget{
DashboardTabs(this.tab, this.makePortfolioDisplay);
final int tab;
final Function makePortfolioDisplay;


@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new DashBoardTabsState();
  }
}

const double appBarElevation = 1.0;
List<CircularSegmentEntry> segments;
final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();
Map colorMap;
List sortedPortfolioDisplay;
List portfolioDisplay;

class DashBoardTabsState extends State<DashboardTabs>
with SingleTickerProviderStateMixin{

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController _tabController;

  final columnProps = [.2, .3, .3];
  final List colors = [
    Colors.purple[400],
    Colors.indigo[400],
    Colors.blue[400],
    Colors.teal[400],
    Colors.green[400],
    Colors.lime[400],
    Colors.orange[400],
    Colors.red[400],
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _tabController.animateTo(widget.tab);
    /*if (timelineData == null) {
      _getTimelineData();
    }
    _makeColorMap();
    _updateBreakdown();
    _sortPortfolioDisplay();*/
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new PreferredSize(
          preferredSize: const Size.fromHeight(75.0),
          child: new AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            titleSpacing: 0.0,
            leading: new Container(),
            //elevation: appBarElevation,
            title:
                new Text("Portfolio", style: Theme.of(context).textTheme.title),
            bottom: new PreferredSize(
                preferredSize: const Size.fromHeight(25.0),
                child: new Container(
                    height: 30.0,
                    child: new TabBar(
                      controller: _tabController,
                      indicatorColor: Theme.of(context).accentIconTheme.color,
                      indicatorWeight: 2.0,
                      unselectedLabelColor: Theme.of(context).disabledColor,
                      labelColor: Theme.of(context).primaryIconTheme.color,
                      tabs: <Widget>[
                        new Tab(text: "Timeline"),
                        new Tab(text: "Breakdown"),
                      ],
                    ))),
          ),
        ),
      body: new TabBarView(
          controller: _tabController,
          children: <Widget>[_breakdown(context), _breakdown(context)],
        )
    );
  }

 Future<Null> _refresh() async {
    widget.makePortfolioDisplay();
    if (_tabController.index == 1) {
      _chartKey.currentState.updateData(
          [new CircularStackEntry(segments, rankKey: "Portfolio Breakdown")]);
    }
    setState(() {});
  }

  _makeSegments() {
    segments = [];
    sortedPortfolioDisplay.forEach((coin) {
      segments.add(new CircularSegmentEntry(
          coin["total_quantity"] * coin["price_usd"], colorMap[coin["symbol"]],
          rankKey: coin["symbol"]));
    });
  }

   _makeColorMap() {
    colorMap = {};
    int colorIndex = 0;
    portfolioDisplay.forEach((coin) {
      if (colorIndex >= colors.length) {
        colorIndex = 1;
      }
      colorMap[coin["symbol"]] = colors[colorIndex];
      colorIndex += 1;
    });
  }



Widget _breakdown(BuildContext context) {
    return portfolioMap.isNotEmpty
        ? new RefreshIndicator(
            onRefresh: _refresh,
            child: new CustomScrollView(
              slivers: <Widget>[
                new SliverList(
                    delegate: new SliverChildListDelegate(<Widget>[
                  new Container(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 10.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text("Portfolio Value",
                                style: Theme.of(context).textTheme.caption),
                            new Row(
                              children: <Widget>[
                                new Text(
                                    "\$" +
                                        '123',
                                    style: Theme.of(context)
                                        .textTheme
                                        .body2
                                        .apply(fontSizeFactor: 2.2)),
                              ],
                            ),
                          ],
                        ),
                      ]
                    )
                  )
                    ]
                    )
                )
              ]
            )
        )
        : new Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: new Text("Your portfolio is empty. Add a transaction!",
                style: Theme.of(context).textTheme.caption));
        }
                    
                  
}