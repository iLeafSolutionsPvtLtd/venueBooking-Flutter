class User {
  String email;
  String phone;
  String first_name;
  String last_name;
  String avatar;
  String user_type;
  String location;

  User(
      {this.email,
      this.phone,
      this.first_name,
      this.last_name,
      this.avatar,
      this.user_type,
      this.location});

  User.map(dynamic obj) {
    this.email = obj["email"];
    this.phone = obj['phone'];
    this.first_name = obj['first_name'];
    this.last_name = obj['last_name'];
    this.avatar = obj['avatar'];
    this.user_type = obj['user_type'];
    this.location = obj['location'];
  }

  String get username => first_name;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = this.email;
    map['phone'] = this.phone;
    map['first_name'] = this.first_name;
    map['last_name'] = last_name;
    map['avatar'] = avatar;
    map['user_type'] = user_type;
    map['location'] = location;
    map["username"] = first_name;
    return map;
  }
}
