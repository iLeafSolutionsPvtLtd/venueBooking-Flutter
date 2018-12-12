import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_places_dialog/flutter_places_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './second_screen.dart';

class SelectLocationView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _selectLocationState();
  }
}

class _selectLocationState extends State<SelectLocationView> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final myController = TextEditingController();
  FocusNode _focus = new FocusNode();
  var _place;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterPlacesDialog.setGoogleApiKey(
        "AIzaSyDU1U59046QEcj-x8jgHQFz2yVf8OHlcbw");

    //_focus.addListener(_onFocusChange);
  }

  showPlacePicker() async {
    var place;
    final SharedPreferences prefs = await _prefs;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      place = await FlutterPlacesDialog.getPlacesDialog();
    } on PlatformException {
      place = null;
    }
    if (!mounted) return;

    print("$place");
    setState(() {
      _place = place;
      prefs.setString('location', place.toString());
      print(prefs.get('location'));
      myController.text = place.address;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Container(
                      height: 15,
                    ),
                    Image(
                      image: AssetImage('assets/locationIcon.png'),
                      height: 28.0,
                      fit: BoxFit.fill,
                    )
                  ],
                ),
                Flexible(
                    child: Container(
                  //height: 100.0,
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: TextField(
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      showPlacePicker();
                    },
                    controller: myController,
                    focusNode: _focus,
                    decoration: InputDecoration(hintText: 'Select location'),
                  ),
                ))
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: () {
                    if (_place != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondScreen()),
                      );
                    } else {
                      Fluttertoast.showToast(
                          msg: "Select your location to continue.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIos: 1);
                    }
                  },
                  child: new Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 26.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.green,
                  padding: const EdgeInsets.all(15.0),
                )
              ],
            )
          ],
        ));
    ;
  }
}
