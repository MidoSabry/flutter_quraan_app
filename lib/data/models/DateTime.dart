import 'Date.dart';
import 'Times.dart';

class Datetime {
  Times times;
  Date date;

  Datetime({
    this.times,
    this.date,
  });

  factory Datetime.fromJson(Map<String, dynamic> json) => Datetime(
        times: json["times"] == null ? null : Times.fromJson(json["times"]),
        date: json["date"] == null ? null : Date.fromJson(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "times": times == null ? null : times.toJson(),
        "date": date == null ? null : date.toJson(),
      };
}
