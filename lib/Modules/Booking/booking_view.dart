import 'package:flutter/material.dart';
import 'package:venue_booking/Modules/Booking/BottomSectionView.dart';
import 'package:venue_booking/Modules/Booking/booking_base_view.dart';
import 'package:venue_booking/Modules/NavigationBar/custom_navigation_bar.dart';

class BookingView extends StatelessWidget {
  final today = DateTime.now();
  var selectedDate = 1;
  TabController _controller;

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
              MyHomePage(),
              BottomSectionView(),
            ],
          ),
        )));
  }
}
