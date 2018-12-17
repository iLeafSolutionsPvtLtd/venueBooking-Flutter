import 'package:flutter/material.dart';
import 'package:venue_booking/views/custom_navigation_bar.dart';
import 'package:venue_booking/views/test.dart';

class BookingView extends StatelessWidget {
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

  int _screen = 0;

  @override
  Widget build(BuildContext context) {
    var numberOfDays = getDaysInMonth(today.year, today.month);
    const List<String> tabNames = const <String>[
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

    return new DefaultTabController(
        length: tabNames.length,
        child: Scaffold(
            body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomNavigationBarWithLocation("ABC venue", "Kochi"),
              TabBarDemo(),
//              new TabBar(
//                tabs: new List.generate(tabNames.length, (index) {
//                  return new Tab(
//                      child: Row(
//                    children: <Widget>[
//                      Image.asset('assets/football.png'),
//                      Container(
//                        width: 5,
//                      ),
//                      Text(tabNames[index].toUpperCase()),
//                    ],
//                  ));
//                }),
//                isScrollable: true,
//                labelColor: Colors.deepOrange,
//                indicatorSize: TabBarIndicatorSize.tab,
//                indicator: UnderlineTabIndicator(
//                    borderSide: BorderSide(width: 1),
//                    insets: EdgeInsets.only(right: 50)),
//              ),
//              new TabBarView(
//                children:
//                    new List<Widget>.generate(tabNames.length, (int index) {
//                  switch (_screen) {
//                    case 0:
//                      return new Center(
//                        child: new Text('First screen, ${tabNames[index]}'),
//                      );
//                    case 1:
//                      return new Center(
//                        child: new Text('Second screen'),
//                      );
//                  }
//                }),
//              ),

              //SportsSelectionView(),
//              Expanded(
//                  child:

//              PageView(
//            children: <Widget>[
//              Card(
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    new Container(
//                      margin: EdgeInsets.only(left: 15, right: 15),
//                      child: new Text("Select your dates",
//                          textAlign: TextAlign.start,
//                          style: const TextStyle(
//                              color: const Color(0xffe8e8e8),
//                              fontWeight: FontWeight.w700,
//                              fontFamily: "GoogleSans",
//                              fontStyle: FontStyle.normal,
//                              fontSize: 24.0)),
//                    ),
//                    new Container(
//                      height: 120.0,
//                      margin: EdgeInsets.only(left: 15, right: 15),
//                      child: new ListView.builder(
//                        scrollDirection: Axis.horizontal,
//                        itemBuilder: (context, index) {
//                          return Card(
//                              shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.vertical(
//                                    top: Radius.circular(5.0),
//                                    bottom: Radius.circular(25.0)),
//                                side: BorderSide(
//                                    width: 0.5,
//                                    color: selectedDate == index + 1
//                                        ? Color.fromRGBO(2, 2, 2, 1.0)
//                                        : Color.fromRGBO(172, 172, 172, 1.0)),
//                              ),
//                              child: Container(
//                                  width: 100,
//                                  child: Column(
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.stretch,
//                                    children: <Widget>[
//                                      Flexible(
//                                        child: Text(
//                                          DateFormat("EEEE")
//                                              .format(DateTime(today.year,
//                                                  today.month, index))
//                                              .toString(),
//                                          style: selectedDate == index + 1
//                                              ? weekDayNameDark
//                                              : weekdayNameLite,
//                                          textAlign: TextAlign.center,
//                                        ),
//                                        flex: 1,
//                                        fit: FlexFit.loose,
//                                      ),
//                                      Flexible(
//                                        child: Text((index + 1).toString(),
//                                            style: selectedDate == index + 1
//                                                ? darkTextStyleForDate
//                                                : textStyleLiteColorForDate,
//                                            textAlign: TextAlign.center),
//                                        flex: 2,
//                                        fit: FlexFit.loose,
//                                      ),
//                                      Flexible(
//                                        child: Text(
//                                            DateFormat("MMM")
//                                                .format(DateTime(today.year,
//                                                    today.month, index + 1))
//                                                .toString(),
//                                            style: selectedDate == index + 1
//                                                ? monthNamedark
//                                                : monthNameLite,
//                                            textAlign: TextAlign.center),
//                                        flex: 1,
//                                      )
//                                    ],
//                                  )));
//                        },
//                        itemCount: numberOfDays,
//                      ),
//                    )
//                  ],
//                ),
//              ),
//              Card(
//                color: Colors.blue,
//              )
//            ],
//          )
//                  )
            ],
          ),
        )));

//    Scaffold(
//        body: Container(
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          CustomNavigationBarWithLocation("ABC venue", "Kochi"),
//          SportsSelectionView(),
//          Expanded(
//              child: TabBarView(
//                  children:
//                      new List<Widget>.generate(tabNames.length, (int index) {
//            switch (_screen) {
//              case 0:
//                return new Center(
//                  child: new Text('First screen, ${tabNames[index]}'),
//                );
//              case 1:
//                return new Center(
//                  child: new Text('Second screen'),
//                );
//            }
//          }))

//              PageView(
//            children: <Widget>[
//              Card(
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    new Container(
//                      margin: EdgeInsets.only(left: 15, right: 15),
//                      child: new Text("Select your dates",
//                          textAlign: TextAlign.start,
//                          style: const TextStyle(
//                              color: const Color(0xffe8e8e8),
//                              fontWeight: FontWeight.w700,
//                              fontFamily: "GoogleSans",
//                              fontStyle: FontStyle.normal,
//                              fontSize: 24.0)),
//                    ),
//                    new Container(
//                      height: 120.0,
//                      margin: EdgeInsets.only(left: 15, right: 15),
//                      child: new ListView.builder(
//                        scrollDirection: Axis.horizontal,
//                        itemBuilder: (context, index) {
//                          return Card(
//                              shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.vertical(
//                                    top: Radius.circular(5.0),
//                                    bottom: Radius.circular(25.0)),
//                                side: BorderSide(
//                                    width: 0.5,
//                                    color: selectedDate == index + 1
//                                        ? Color.fromRGBO(2, 2, 2, 1.0)
//                                        : Color.fromRGBO(172, 172, 172, 1.0)),
//                              ),
//                              child: Container(
//                                  width: 100,
//                                  child: Column(
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.stretch,
//                                    children: <Widget>[
//                                      Flexible(
//                                        child: Text(
//                                          DateFormat("EEEE")
//                                              .format(DateTime(today.year,
//                                                  today.month, index))
//                                              .toString(),
//                                          style: selectedDate == index + 1
//                                              ? weekDayNameDark
//                                              : weekdayNameLite,
//                                          textAlign: TextAlign.center,
//                                        ),
//                                        flex: 1,
//                                        fit: FlexFit.loose,
//                                      ),
//                                      Flexible(
//                                        child: Text((index + 1).toString(),
//                                            style: selectedDate == index + 1
//                                                ? darkTextStyleForDate
//                                                : textStyleLiteColorForDate,
//                                            textAlign: TextAlign.center),
//                                        flex: 2,
//                                        fit: FlexFit.loose,
//                                      ),
//                                      Flexible(
//                                        child: Text(
//                                            DateFormat("MMM")
//                                                .format(DateTime(today.year,
//                                                    today.month, index + 1))
//                                                .toString(),
//                                            style: selectedDate == index + 1
//                                                ? monthNamedark
//                                                : monthNameLite,
//                                            textAlign: TextAlign.center),
//                                        flex: 1,
//                                      )
//                                    ],
//                                  )));
//                        },
//                        itemCount: numberOfDays,
//                      ),
//                    )
//                  ],
//                ),
//              ),
//              Card(
//                color: Colors.blue,
//              )
//            ],
//          )
//              )
//        ],
//      ),
//    ));
  }
}
