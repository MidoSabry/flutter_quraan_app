import 'dart:convert';

import 'package:flutter/services.dart';

import 'models/JadwalDaily.dart';
import 'package:http/http.dart' as http;

import 'models/allasmaul.dart';
import 'models/alldoa.dart';
import 'models/allsurah.dart';
import 'models/surahinfo.dart';

class ServiceData {
  var infosurah = 'surah/surah-info.json';
  var listdoa = 'surah/doa-harian.json';
  var listasmaulhusna = 'surah/asmaul-husna.json';
  var ayatkursi = 'surah/ayat-kursi.json';
  var jadwalsholat = 'https://api.pray.zone/v2/times/today.json?city=';

  Future<JadwalDaily> loadJadwalSholat(String lokasi) async {
    var response = await http.get('$jadwalsholat$lokasi');
    var res = json.decode(response.body);
    return JadwalDaily.fromJson(res);
  }

  Future<List<SurahInfo>> loadInfo() async {
    var response = await rootBundle.loadString(infosurah);
    Iterable data = json.decode(response);
    return data.map((model) => SurahInfo.fromJson(model)).toList();
  }

  Future<List<AllDoa>> loadDoa() async {
    var response = await rootBundle.loadString(listdoa);
    var res = json.decode(response);
    Iterable data = res['data'];
    return data.map((model) => AllDoa.fromJson(model)).toList();
  }

  Future<List<AllAsmaul>> loadAsmaul() async {
    var response = await rootBundle.loadString(listasmaulhusna);
    var res = json.decode(response);
    Iterable data = res['data'];
    return data.map((model) => AllAsmaul.fromJson(model)).toList();
  }

  Future<AllSurah> loadSurah(int number) async {
    final response = await rootBundle.loadString('surah/$number.json');
    var res = json.decode(response);
    var data = res['$number'];
    return AllSurah.fromJson(data);
  }
}
