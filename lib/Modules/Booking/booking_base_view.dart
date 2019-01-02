import 'package:flutter/material.dart';

import 'package:venue_booking/Modules/Booking/DateAndGroundSelectionView.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List tabNames = [
    'foo',
    'bar',
    'baz',
    'quox',
    'quuz',
    'corge',
    'grault',
    'garply',
    'waldo'
  ];

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: tabNames.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: new Column(
      children: <Widget>[
        new Container(
          child: new TabBar(
            tabs: new List.generate(tabNames.length, (index) {
              return new Tab(
                  child: Row(
                children: <Widget>[
                  Image.asset('assets/football.png'),
                  Container(
                    width: 5,
                  ),
                  Text(tabNames[index].toUpperCase()),
                ],
              ));
            }),
            isScrollable: true,
            controller: _controller,
            labelColor: Colors.black,
            unselectedLabelColor: Color(0xffc4c1c1),
            indicatorWeight: 2.0,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Color.fromRGBO(34, 176, 40, 1.0),
          ),
        ),
        new Container(
          height: 1,
        ),
        new Expanded(
//          height: 80.0,
          child: new TabBarView(
            controller: _controller,
            children: new List<Widget>.generate(tabNames.length, (int index) {
              return new Center(
                child: new DateSelector(),
              );
            }),
          ),
        ),
      ],
    ));
  }
}
