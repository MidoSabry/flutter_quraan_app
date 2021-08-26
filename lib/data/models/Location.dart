class Location {
  double latitude;
  double longitude;
  double elevation;
  String city;
  String country;
  String countryCode;
  String timezone;
  double localOffset;

  Location({
    this.latitude,
    this.longitude,
    this.elevation,
    this.city,
    this.country,
    this.countryCode,
    this.timezone,
    this.localOffset,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude:
            json["longitude"] == null ? null : json["longitude"].toDouble(),
        elevation: json["elevation"] == null ? null : json["elevation"],
        city: json["city"] == null ? null : json["city"],
        country: json["country"] == null ? null : json["country"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        timezone: json["timezone"] == null ? null : json["timezone"],
        localOffset: json["local_offset"] == null ? null : json["local_offset"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "elevation": elevation == null ? null : elevation,
        "city": city == null ? null : city,
        "country": country == null ? null : country,
        "country_code": countryCode == null ? null : countryCode,
        "timezone": timezone == null ? null : timezone,
        "local_offset": localOffset == null ? null : localOffset,
      };
}
