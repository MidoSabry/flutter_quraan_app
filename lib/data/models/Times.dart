class Times {
  String sunrise;
  String fajr;
  String dhuhr;
  String asr;
  String maghrib;
  String isha;
  String midnight;

  Times({
    this.sunrise,
    this.fajr,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
    this.midnight,
  });

  factory Times.fromJson(Map<String, dynamic> json) => Times(
        sunrise: json["Sunrise"] == null ? null : json["Sunrise"],
        fajr: json["Fajr"] == null ? null : json["Fajr"],
        dhuhr: json["Dhuhr"] == null ? null : json["Dhuhr"],
        asr: json["Asr"] == null ? null : json["Asr"],
        maghrib: json["Maghrib"] == null ? null : json["Maghrib"],
        isha: json["Isha"] == null ? null : json["Isha"],
        midnight: json["Midnight"] == null ? null : json["Midnight"],
      );

  Map<String, dynamic> toJson() => {
        "Sunrise": sunrise == null ? null : sunrise,
        "Fajr": fajr == null ? null : fajr,
        "Dhuhr": dhuhr == null ? null : dhuhr,
        "Asr": asr == null ? null : asr,
        "Maghrib": maghrib == null ? null : maghrib,
        "Isha": isha == null ? null : isha,
        "Midnight": midnight == null ? null : midnight,
      };
}
