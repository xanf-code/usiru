// To parse this JSON data, do
//
//     final stationData = stationDataFromJson(jsonString);

import 'dart:convert';

StationData stationDataFromJson(String str) => StationData.fromJson(json.decode(str));

String stationDataToJson(StationData data) => json.encode(data.toJson());

class StationData {
  StationData({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory StationData.fromJson(Map<String, dynamic> json) => StationData(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.uid,
    this.aqi,
    this.time,
    this.station,
  });

  int uid;
  String aqi;
  Time time;
  Station station;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    uid: json["uid"],
    aqi: json["aqi"],
    time: Time.fromJson(json["time"]),
    station: Station.fromJson(json["station"]),
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "aqi": aqi,
    "time": time.toJson(),
    "station": station.toJson(),
  };
}

class Station {
  Station({
    this.name,
    this.geo,
    this.url,
    this.country,
  });

  String name;
  List<double> geo;
  String url;
  String country;

  factory Station.fromJson(Map<String, dynamic> json) => Station(
    name: json["name"],
    geo: List<double>.from(json["geo"].map((x) => x.toDouble())),
    url: json["url"],
    country: json["country"] == null ? null : json["country"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "geo": List<dynamic>.from(geo.map((x) => x)),
    "url": url,
    "country": country == null ? null : country,
  };
}

class Time {
  Time({
    this.tz,
    this.stime,
    this.vtime,
  });

  Tz tz;
  DateTime stime;
  int vtime;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    tz: tzValues.map[json["tz"]],
    stime: DateTime.parse(json["stime"]),
    vtime: json["vtime"],
  );

  Map<String, dynamic> toJson() => {
    "tz": tzValues.reverse[tz],
    "stime": stime.toIso8601String(),
    "vtime": vtime,
  };
}

enum Tz { THE_0530 }

final tzValues = EnumValues({
  "+05:30": Tz.THE_0530
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
