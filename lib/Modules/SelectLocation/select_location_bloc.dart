import 'package:flutter_places_dialog/flutter_places_dialog.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:venue_booking/Managers/UserManager.dart';

class SelectLocationBloc {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final _locationController = BehaviorSubject<PlaceDetails>();

  Observable<PlaceDetails> get placeDetails => _locationController.stream;
  Observable<bool> get checkLocation =>
      Observable.combineLatest2(placeDetails, placeDetails, (a, b) => true);

  fetchLocation() async {
    PlaceDetails locationDetails = await FlutterPlacesDialog.getPlacesDialog();
    final manager = UserManager();
    manager.saveLocation(locationDetails);
    _locationController.sink.add(locationDetails);
  }

  dispose() {
    _locationController.close();
  }
}
