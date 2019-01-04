import 'package:flutter_places_dialog/flutter_places_dialog.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectLocationBloc {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final _locationController = BehaviorSubject<PlaceDetails>();

  Observable<PlaceDetails> get placeDetails => _locationController.stream;

  fetchLocation() async {
    PlaceDetails locationDetails = await FlutterPlacesDialog.getPlacesDialog();
    final SharedPreferences prefs = await _prefs;
    prefs.setString('location', locationDetails.toString());
    _locationController.sink.add(locationDetails);
  }

  dispose() {
    _locationController.close();
  }
}

final selectLocationBloc = SelectLocationBloc();
