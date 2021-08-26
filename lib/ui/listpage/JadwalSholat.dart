import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_quran_app/data/location.dart';
import 'package:flutter_quran_app/data/models/JadwalDaily.dart';
import 'package:flutter_quran_app/data/servicesData.dart';
import 'package:flutter_quran_app/data/utils/style.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class JadwalSholat extends StatefulWidget {
  @override
  _JadwalSholatState createState() => _JadwalSholatState();
}

class _JadwalSholatState extends State<JadwalSholat> {
  @override
  Widget build(BuildContext context) {
    var loc = Provider.of<LocationNotifier>(context);
    var f = DateFormat('dd/MM\nyyy');
    return FutureBuilder<JadwalDaily>(
      future: ServiceData().loadJadwalSholat(loc.location),
      builder: (c, snapshot) {
        if (snapshot.hasData)
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView(
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            '${snapshot.data.results.location.city}',
                            style: AppStyle.title,
                          ),
                          subtitle:
                              Text(snapshot.data.results.location.country),
                          trailing: Text(
                            '${f.format(snapshot.data.results.datetime[0].date.gregorian)}',
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    ListTile(
                      trailing: Image.asset('images/subuh.png'),
                      title: Text('FAJR'),
                      subtitle:
                          Text(snapshot.data.results.datetime[0].times.fajr),
                    ),
                    ListTile(
                      trailing: Image.asset('images/terbit.png'),
                      title: Text('SHORUQ'),
                      subtitle:
                          Text(snapshot.data.results.datetime[0].times.sunrise),
                    ),
                    ListTile(
                      trailing: Image.asset('images/zuhur.png'),
                      title: Text('ZUHUR'),
                      subtitle:
                          Text(snapshot.data.results.datetime[0].times.dhuhr),
                    ),
                    ListTile(
                      trailing: Image.asset('images/ashar.png'),
                      title: Text('ASAR'),
                      subtitle:
                          Text(snapshot.data.results.datetime[0].times.asr),
                    ),
                    ListTile(
                      trailing: Image.asset('images/magrib.png'),
                      title: Text('MAGRIB'),
                      subtitle:
                          Text(snapshot.data.results.datetime[0].times.maghrib),
                    ),
                    ListTile(
                      trailing: Image.asset('images/isya.png'),
                      title: Text('ISYA'),
                      subtitle:
                          Text(snapshot.data.results.datetime[0].times.isha),
                    ),
                  ],
                ),
              ],
            ),
          );
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
