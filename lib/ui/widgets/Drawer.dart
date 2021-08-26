import 'package:flutter/material.dart';
import 'package:flutter_quran_app/data/utils/style.dart';

class Drawers extends StatelessWidget {
  const Drawers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(),
              Text(
                'Quran',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              AppStyle.spaceH5,
              Text(
                'By Mido sabry',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
        ListTile(
            title: Text('About'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.popAndPushNamed(context, '/about')),
        ListTile(
            title: Text('Settings'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.popAndPushNamed(context, '/settings')),
        ListTile(
            title: Text('Arah Kiblat'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.popAndPushNamed(context, '/kiblah')),
      ],
    );
  }
}
