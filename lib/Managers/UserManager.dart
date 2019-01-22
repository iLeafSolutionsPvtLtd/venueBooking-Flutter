import 'package:venue_booking/Managers/DatabaseManager.dart';
import 'package:venue_booking/Models/user.dart';

class UserManager {
  Future<User> userDetails() async {
    var dbClient = await DatabaseManager().db;
    List<Map> maps = await dbClient.rawQuery('SELECT * FROM User');
    if (maps.length > 0) {
      return User.map(maps.first);
    }
    return null;
  }

  Future<int> saveUser(User user) async {
    var dbClient = await DatabaseManager().db;
    int res = await dbClient.insert("User", user.toMap());
    return res;
  }
}
