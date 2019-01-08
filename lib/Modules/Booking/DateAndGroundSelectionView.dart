import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:rect_getter/rect_getter.dart';

class DateSelector extends StatefulWidget {
  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  final today = DateTime.now();
  var selectedDate = 1;
  static const List<int> _kDaysInMonth = const <int>[
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];

  static int getDaysInMonth(int year, int month) {
    if (month == 2) {
      final bool isLeapYear =
          (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      if (isLeapYear) return 29;
    }
    return _kDaysInMonth[month - 1];
  }

  TextStyle weekDayNameDark = TextStyle(
      color: const Color(0xff000000),
      fontWeight: FontWeight.w700,
      fontFamily: "GoogleSans",
      fontStyle: FontStyle.normal,
      fontSize: 12.0,
      height: 2);

  TextStyle weekdayNameLite = TextStyle(
      color: const Color(0xffe8e8e8),
      fontWeight: FontWeight.w400,
      fontFamily: "GoogleSans",
      fontStyle: FontStyle.normal,
      fontSize: 12.0,
      height: 2);

  TextStyle monthNamedark = TextStyle(
      color: const Color(0xff000000),
      fontWeight: FontWeight.w700,
      fontFamily: "GoogleSans",
      fontStyle: FontStyle.normal,
      fontSize: 14.5);

  TextStyle monthNameLite = TextStyle(
      color: const Color(0xffe8e8e8),
      fontWeight: FontWeight.w400,
      fontFamily: "GoogleSans",
      fontStyle: FontStyle.normal,
      fontSize: 14.5);

  TextStyle textStyleLiteColorForDate = TextStyle(
      color: const Color(0xffe8e8e8),
      fontWeight: FontWeight.w700,
      fontFamily: "GoogleSans",
      fontStyle: FontStyle.normal,
      fontSize: 36.0);

  TextStyle darkTextStyleForDate = TextStyle(
    color: const Color(0xff000000),
    fontWeight: FontWeight.w700,
    fontFamily: "GoogleSans",
    fontStyle: FontStyle.normal,
    fontSize: 36.0,
  );

  @override
  Widget build(BuildContext context) {
    var numberOfDays = getDaysInMonth(today.year, today.month);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 10,
        ),
        new Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: new Text("Select your dates",
              textAlign: TextAlign.start,
              style: const TextStyle(
                  color: const Color(0xffe8e8e8),
                  fontWeight: FontWeight.w700,
                  fontFamily: "GoogleSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 24.0)),
        ),
        Container(
          height: 10,
        ),
        new Container(
          height: 120.0,
          margin: EdgeInsets.only(left: 15, right: 15),
          child: new ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(5.0),
                        bottom: Radius.circular(25.0)),
                    side: BorderSide(
                        width: 0.5,
                        color: selectedDate == index + 1
                            ? Color.fromRGBO(2, 2, 2, 1.0)
                            : Color.fromRGBO(172, 172, 172, 1.0)),
                  ),
                  child: Container(
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              DateFormat("EEEE")
                                  .format(
                                      DateTime(today.year, today.month, index))
                                  .toString(),
                              style: selectedDate == index + 1
                                  ? weekDayNameDark
                                  : weekdayNameLite,
                              textAlign: TextAlign.center,
                            ),
                            flex: 1,
                            fit: FlexFit.loose,
                          ),
                          Flexible(
                            child: Text((index + 1).toString(),
                                style: selectedDate == index + 1
                                    ? darkTextStyleForDate
                                    : textStyleLiteColorForDate,
                                textAlign: TextAlign.center),
                            flex: 2,
                            fit: FlexFit.loose,
                          ),
                          Flexible(
                            child: Text(
                                DateFormat("MMM")
                                    .format(DateTime(
                                        today.year, today.month, index + 1))
                                    .toString(),
                                style: selectedDate == index + 1
                                    ? monthNamedark
                                    : monthNameLite,
                                textAlign: TextAlign.center),
                            flex: 1,
                          )
                        ],
                      )));
            },
            itemCount: numberOfDays,
          ),
        ),
        TimeslotSelectionView(),
        //
      ],
    );
  }
}

class TimeslotSelectionView extends StatefulWidget {
  @override
  _TimeslotSelectionViewState createState() => _TimeslotSelectionViewState();
}

class _TimeslotSelectionViewState extends State<TimeslotSelectionView> {
  TabController _controller;
  List tabNames = ['Ground 1', 'Ground 2', 'Ground 3', 'Ground 4', 'Ground 5'];
  ScrollController _scroll_controller = new ScrollController();
  var _selectedTimeslot = 5;
  var _keys = {};

  TextStyle a = TextStyle(
      color: const Color(0xff000000),
      fontWeight: FontWeight.w700,
      fontFamily: "GoogleSans",
      fontStyle: FontStyle.normal,
      fontSize: 15.0);

  TextStyle b = TextStyle(
      color: const Color(0xff000000),
      fontWeight: FontWeight.w500,
      fontFamily: "GoogleSans",
      fontStyle: FontStyle.normal,
      fontSize: 13.3);

  Icon downArrow = Icon(
    Icons.details,
    color: Colors.green,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var listViewKey = RectGetter.createGlobalKey();
  var timeSlotMarker = RectGetter.createGlobalKey();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 20,
        ),
        Container(
          child: new Text("Select your play area",
              style: const TextStyle(
                  color: const Color(0xffe8e8e8),
                  fontWeight: FontWeight.w700,
                  fontFamily: "GoogleSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 24.0)),
          margin: EdgeInsets.only(left: 15.0, right: 15.0),
        ),
        Container(
          height: 10,
        ),
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: new Text("Select your time slot",
                        style: const TextStyle(
                            color: const Color(0xffe8e8e8),
                            fontWeight: FontWeight.w700,
                            fontFamily: "GoogleSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 24.0)),
                  ),
                  Container(
                    height: 10,
                  ),
                  Flexible(
                    child: Container(
//                      decoration: BoxDecoration(color: Colors.deepOrange),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: RectGetter(
                              key: timeSlotMarker,
                              child: downArrow,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(color: Colors.green),
                            height: 1.0,
                            margin: EdgeInsets.only(left: 15.0, right: 15.0),
                          ),
                          Container(
                            child: PageView.builder(
                                controller:
                                    PageController(viewportFraction: 0.15),
                                onPageChanged: (selectedIndex) {
                                  setState(() {
                                    _selectedTimeslot = selectedIndex;
                                  });
                                },
                                itemBuilder: (context, index) {
                                  _keys[index] = RectGetter.createGlobalKey();

                                  return RectGetter(
                                      key: _keys[index],
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              left: 10.0, right: 10.0),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                '!',
                                                textAlign: TextAlign.center,
                                                style:
                                                    _selectedTimeslot == index
                                                        ? a
                                                        : b,
                                              ),
                                              Text(
                                                '10.00',
                                                style:
                                                    _selectedTimeslot == index
                                                        ? a
                                                        : b,
                                              )
                                            ],
                                          )));
                                }),
//                            decoration: BoxDecoration(color: Colors.blue),
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      ],
    ));
  }
}
