import 'package:flutter/material.dart';
import 'package:flutter_places_dialog/flutter_places_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:venue_booking/Modules/MobileNumberValidation/add_mobile_number.dart';

import 'select_location_bloc.dart';

class GetLocationView extends StatelessWidget {
  final myController = TextEditingController();
  final FocusNode _focus = new FocusNode();
  var _place;

  @override
  Widget build(BuildContext context) {
    FlutterPlacesDialog.setGoogleApiKey(
        "AIzaSyDU1U59046QEcj-x8jgHQFz2yVf8OHlcbw");
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
                  child: StreamBuilder<PlaceDetails>(
                    stream: selectLocationBloc.placeDetails,
                    builder: (context, snapshot) {
                      _place = snapshot.data;
                      myController.text =
                          snapshot.hasData ? snapshot.data.address : "";
                      return TextField(
                        onTap: () {
                          selectLocationBloc.fetchLocation();
                          if (snapshot.hasData) {}
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                        controller: myController,
                        focusNode: _focus,
                        decoration: InputDecoration(
                          hintText: 'Select location',
                        ),
                      );
                    },
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
                        MaterialPageRoute(builder: (context) => AddMobile()),
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
  }
}
