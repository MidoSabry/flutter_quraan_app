import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/location.dart';
import 'data/themes.dart';
import 'data/uistate.dart';
import 'ui/about.dart';
import 'ui/compass.dart';
import 'ui/home.dart';
import 'ui/settings.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UiState()),
      ChangeNotifierProvider(create: (_) => ThemeNotifier()),
      ChangeNotifierProvider(create: (_) => LocationNotifier()),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran',
      theme: Provider.of<ThemeNotifier>(context).curretThemeData,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/settings': (context) => Settings(),
        '/about': (context) => About(),
        '/kiblah': (context) => Compass(),
      },
    );
  }
}
