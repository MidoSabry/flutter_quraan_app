import 'package:flutter/material.dart';
import 'package:flutter_quran_app/data/utils/data.dart';
import 'package:flutter_quran_app/ui/listpage/JadwalSholat.dart';
import 'package:flutter_quran_app/ui/listpage/listOfAsmaAllah.dart';
import 'package:flutter_quran_app/ui/listpage/listOfDoa.dart';
import 'package:flutter_quran_app/ui/listpage/listOfQuran.dart';

import 'about.dart';
import 'widgets/Drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: Drawers()),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    Static.appName,
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 220,
                ),
                IconButton(
                  icon: Icon(Icons.info_outline),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => About()));
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                //collapseMode: CollapseMode.pin,
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
              expandedHeight: 100.0,
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white.withOpacity(0.6),
                labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Text(
                      'Jadwal Sholat',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Alquran',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Doa ',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Asmaul Husna',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            JadwalSholat(),
            ListAlquran(),
            ListDoa(),
            ListAsmaul(),
          ],
        ),
      ),
    );
  }
}
