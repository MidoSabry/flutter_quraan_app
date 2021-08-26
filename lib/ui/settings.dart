import 'package:flutter/material.dart';
import 'package:flutter_quran_app/data/location.dart';
import 'package:flutter_quran_app/data/themes.dart';
import 'package:flutter_quran_app/data/uistate.dart';
import 'package:provider/provider.dart';

import 'widgets/cardsetting.dart';
import 'widgets/cardslider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<UiState>(context);
    var dark = Provider.of<ThemeNotifier>(context);
    var loc = Provider.of<LocationNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Settings'),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Location'),
            subtitle: Text(loc.location),
            trailing: IconButton(
              icon: Icon(Icons.gps_fixed),
              // onPressed: () => loc.locationNow(),
            ),
          ),
          CardSetting(
            title: 'Tema Gelap',
            leading: Switch(
              value: dark.darkmode,
              onChanged: (newValue) => dark.switchTheme(newValue),
            ),
          ),
          CardSetting(
            title: 'Terjemahan',
            leading: Switch(
              value: ui.terjemahan,
              onChanged: (newValue) => ui.terjemahan = newValue,
            ),
          ),
          CardSetting(
            title: 'Tafsir',
            leading: Switch(
              value: ui.tafsir,
              onChanged: (newValue) => ui.tafsir = newValue,
            ),
          ),
          CardSlider(
            title: 'Ukuran teks arab',
            slider: Slider(
              min: 0.5,
              value: ui.sliderFontSize,
              onChanged: (newValue) => ui.fontSize = newValue,
            ),
            trailing: ui.fontSize.toInt().toString(),
          ),
          CardSlider(
            title: 'Ukuran teks terjemahan',
            slider: Slider(
              min: 0.4,
              value: ui.sliderFontSizetext,
              onChanged: (newValue) => ui.fontSizetext = newValue,
            ),
            trailing: ui.fontSizetext.toInt().toString(),
          ),
        ],
      ),
    );
  }
}
