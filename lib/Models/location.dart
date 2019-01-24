class Location {
  String name;
  String latitude;
  String longitude;

  Location(this.latitude, this.longitude, this.name);
  Location.map(dynamic obj) {
    this.latitude = obj["latitude"];
    this.longitude = obj["longitude"];
    this.name = obj["name"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["latitude"] = this.latitude;
    map["longitude"] = this.longitude;
    map["name"] = this.name;
    return map;
  }
}
