import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
// import 'package:package_info/package_info.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  String version = '0';
  String buildNumber = '0';
  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        version = packageInfo.version;
        buildNumber = packageInfo.buildNumber;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('About'),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 0,
              child: ListTile(
                title: Text('Version'),
                trailing: Text('$version+$buildNumber'),
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Text('Quran'),
                //trailing: Text('https://github.com/MidoSabry'),
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Text('Doa'),
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Text('Jadwal Sholat'),
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Text('Asmaul Husna'),
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Text('Compass'),
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Text('Application'),
                trailing: Text('Done by Mohamed sabry'),
              ),
            ),
            Spacer(),
            Center(child: Text('Made With Love in Egypt')),
          ],
        ),
      ),
    );
  }
}
