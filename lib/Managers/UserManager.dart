import 'package:flutter_places_dialog/flutter_places_dialog.dart';
import 'package:venue_booking/Managers/DatabaseManager.dart';
import 'package:venue_booking/Models/location.dart';
import 'package:venue_booking/Models/user.dart';

class UserManager {
  Future<int> saveLocation(PlaceDetails locaionDetails) async {
    var dbClient = await DatabaseManager().db;
    Location location = Location(locaionDetails.location.latitude.toString(),
        locaionDetails.location.longitude.toString(), locaionDetails.name);
    int res = await dbClient.insert("Location", location.toMap());
    return res;
  }

  Future<Location> locationDetails() async {
    var dbClient = await DatabaseManager().db;
    List<Map> maps = await dbClient.rawQuery('SELECT * FROM Location');
    if (maps.length > 0) {
      return Location.map(maps.first);
    }
    return null;
  }

  Future<User> userDetails() async {
    var dbClient = await DatabaseManager().db;
    List<Map> maps = await dbClient.rawQuery('SELECT * FROM User');
    if (maps.length > 0) {
      return User.fromJson(maps.first);
    }
    return null;
  }

  Future<int> saveUser(User user) async {
    var dbClient = await DatabaseManager().db;
    int res = await dbClient.insert("User", user.toJson());
    return res;
  }

  Future<int> deleteUser(User user) async {
    var dbClient = await DatabaseManager().db;
    int res = await dbClient.delete("User");
    return res;
  }
}
