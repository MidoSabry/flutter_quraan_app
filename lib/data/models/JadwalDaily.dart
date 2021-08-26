import 'dart:convert';

import 'Results.dart';

JadwalDaily jadwalDailyFromJson(String str) =>
    JadwalDaily.fromJson(json.decode(str));

String jadwalDailyToJson(JadwalDaily data) => json.encode(data.toJson());

class JadwalDaily {
  int code;
  String status;
  Results results;

  JadwalDaily({
    this.code,
    this.status,
    this.results,
  });

  factory JadwalDaily.fromJson(Map<String, dynamic> json) => JadwalDaily(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        results:
            json["results"] == null ? null : Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "status": status == null ? null : status,
        "results": results == null ? null : results.toJson(),
      };
}
