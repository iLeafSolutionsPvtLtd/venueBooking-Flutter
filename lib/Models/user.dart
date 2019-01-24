class VerifyOTPResponse {
  String refresh;
  String access;
  User user;

  VerifyOTPResponse({this.refresh, this.access, this.user});

  VerifyOTPResponse.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  Null lastLogin;
  Null email;
  String phone;
  String firstName;
  String lastName;
  String dateJoined;
  bool isActive;
  Null avatar;
  Null userType;
  Null location;

  User(
      {this.id,
      this.lastLogin,
      this.email,
      this.phone,
      this.firstName,
      this.lastName,
      this.dateJoined,
      this.isActive,
      this.avatar,
      this.userType,
      this.location});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lastLogin = json['last_login'];
    email = json['email'];
    phone = json['phone'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dateJoined = json['date_joined'];
    isActive = json['is_active'];
    avatar = json['avatar'];
    userType = json['user_type'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['last_login'] = this.lastLogin;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['date_joined'] = this.dateJoined;
    data['is_active'] = this.isActive;
    data['avatar'] = this.avatar;
    data['user_type'] = this.userType;
    data['location'] = this.location;
    return data;
  }
}
