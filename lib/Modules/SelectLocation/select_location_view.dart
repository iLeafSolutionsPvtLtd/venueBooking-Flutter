import 'package:flutter/material.dart';
import 'package:flutter_places_dialog/flutter_places_dialog.dart';
import 'package:geolocator/geolocator.dart';
import 'package:venue_booking/Modules/Blocks/blocProvider.dart';
import 'package:venue_booking/Modules/MobileNumberValidation/add_mobile_number_view.dart';
import 'package:venue_booking/Modules/SelectLocation/select_location_bloc.dart';

import 'select_location_bloc.dart';

class GetLocationView extends StatefulWidget {
  @override
  GetLocationViewState createState() {
    return new GetLocationViewState();
  }
}

class GetLocationViewState extends State<GetLocationView> {
  final myController = TextEditingController();

  final FocusNode _focus = new FocusNode();

  var _place;

  getLocation() async {
    Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
    GeolocationStatus geolocationStatus =
        await geolocator.checkGeolocationPermissionStatus();
    print(geolocationStatus);
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    //List<Placemark> placemark = await Geolocator()
    //  .placemarkFromCoordinates(position.longitude, position.longitude);

    // print('geo location : $placemark.first.name');
  }

  @override
  void initState() {
    FlutterPlacesDialog.setGoogleApiKey(
        "AIzaSyDU1U59046QEcj-x8jgHQFz2yVf8OHlcbw");
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectLocationBloc = Provider.of<SelectLocationBloc>(context);

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
                StreamBuilder<bool>(
                    stream: selectLocationBloc.checkLocation,
                    builder: (context, snapshot) => RawMaterialButton(
                          onPressed: () => (snapshot.hasData)
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddMobileView()),
                                )
                              : null,
                          child: new Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 26.0,
                          ),
                          shape: new CircleBorder(),
                          elevation: 2.0,
                          fillColor:
                              snapshot.hasData ? Colors.green : Colors.grey,
                          padding: const EdgeInsets.all(15.0),
                        )),
              ],
            )
          ],
        ));
  }
}
