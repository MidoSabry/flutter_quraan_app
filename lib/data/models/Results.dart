import 'Location.dart';

import 'DateTime.dart';

class Results {
  List<Datetime> datetime;
  Location location;
  //Settings settings;
  Results({
    this.datetime,
    this.location,
    //this.settings,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        datetime: json["datetime"] == null
            ? null
            : List<Datetime>.from(
                json["datetime"].map((x) => Datetime.fromJson(x))),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        //settings: json["settings"] == null ? null : Settings.fromJson(json["settings"]),
      );

  Map<String, dynamic> toJson() => {
        "datetime": datetime == null
            ? null
            : List<dynamic>.from(datetime.map((x) => x.toJson())),
        "location": location == null ? null : location.toJson(),
        //"settings": settings == null ? null : settings.toJson(),
      };
}
