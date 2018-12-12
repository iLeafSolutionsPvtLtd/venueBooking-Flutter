import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './views/select_location_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp();

  factory MyApp.forDesignTime() {
    // TODO: add arguments
    return new MyApp();
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var products;

  void _getData() async {
    final url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final map = json.decode(response.body);
      setState(() {
        this.products = map;
      });
      print(map);
    }
  }

  // title section

  Widget titleSection = Container(
    padding: EdgeInsets.all(10.0),
    child: Text("Hi there! \nWhere are you from?",
        style: const TextStyle(
            color: const Color(0xff000000),
            fontWeight: FontWeight.w700,
            fontFamily: "GoogleSans",
            fontStyle: FontStyle.normal,
            fontSize: 33.0)),
  );

  // subtitle section
  Widget subTitleSection = Container(
    padding: EdgeInsets.all(10.0),
    child: Text(
        "We need your current location to load near by venues and events. Please give us access to your GPS location or you can enter mannulally below.",
        style: const TextStyle(
            color: const Color(0xffc7c7c7),
            fontWeight: FontWeight.w400,
            fontFamily: "GoogleSans",
            fontStyle: FontStyle.normal,
            fontSize: 16.7)),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            brightness: Brightness.dark,
            elevation: 0.0,
            title: Text('Booking'),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    //_getData();
                  })
            ],
          ),
          body: ListView(
            children: <Widget>[
              titleSection,
              subTitleSection,
              SelectLocationView()
            ],
          )
          //ProductManager(products),
          ),
    );
  }
}
