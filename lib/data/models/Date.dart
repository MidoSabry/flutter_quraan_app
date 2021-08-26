class Date {
  int timestamp;
  DateTime gregorian;
  DateTime hijri;

  Date({
    this.timestamp,
    this.gregorian,
    this.hijri,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
        gregorian: json["gregorian"] == null
            ? null
            : DateTime.parse(json["gregorian"]),
        hijri: json["hijri"] == null ? null : DateTime.parse(json["hijri"]),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp == null ? null : timestamp,
        "gregorian": gregorian == null
            ? null
            : "${gregorian.year.toString().padLeft(4, '0')}-${gregorian.month.toString().padLeft(2, '0')}-${gregorian.day.toString().padLeft(2, '0')}",
        "hijri": hijri == null
            ? null
            : "${hijri.year.toString().padLeft(4, '0')}-${hijri.month.toString().padLeft(2, '0')}-${hijri.day.toString().padLeft(2, '0')}",
      };
}
