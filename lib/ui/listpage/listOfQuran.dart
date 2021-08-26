import 'package:flutter/material.dart';
import 'package:flutter_quran_app/data/models/surahinfo.dart';
import 'package:flutter_quran_app/data/servicesData.dart';
import 'package:flutter_quran_app/ui/widgets/cardsurah.dart';
import 'package:pk_skeleton/pk_skeleton.dart';

import '../detailsurah.dart';

class ListAlquran extends StatefulWidget {
  @override
  _ListAlquranState createState() => _ListAlquranState();
}

class _ListAlquranState extends State<ListAlquran> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SurahInfo>>(
      future: ServiceData().loadInfo(),
      builder: (c, snapshot) {
        return snapshot.hasData
            ? ListView(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: snapshot.data
                    .map((data) => CardSurah(
                          title: data.arabic.toString(),
                          subtitle: data.latin.toString(),
                          surah: data.index.toString(),
                          ayah: data.ayahCount.toString(),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailSurah(
                                        detail: data.arabic,
                                        index: data.index)));
                          },
                        ))
                    .toList())
            : PKCardListSkeleton(
                isCircularImage: true,
                isBottomLinesActive: true,
                length: 10,
              );
      },
    );
  }
}
