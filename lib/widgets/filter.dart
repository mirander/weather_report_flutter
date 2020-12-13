import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:weather_report/models/Settings.dart';
import 'package:weather_report/providers/SettingsProvider.dart';

class Filter extends StatelessWidget {
  const Filter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final setProvider = Provider.of<SettingsProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: DropdownButton<String>(
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.white,
        ),
        iconSize: 15,
        elevation: 7,
        underline: Container(
          height: 2,
          color: Colors.red[400],
        ),
        value: setProvider.filter,
        items: <DropdownMenuItem<String>>[
          DropdownMenuItem(
            child: Text(
              FlutterI18n.translate(context, "filterDay"),
            ),
            value: SettingsModel.BY_DAYS,
          ),
          DropdownMenuItem(
            child: Text(
              FlutterI18n.translate(context, "filterHours"),
            ),
            value: SettingsModel.BY_HOURS,
          ),
        ],
        onChanged: (String value) {
          setProvider.setSettings(value);
        },
      ),
    );
  }
}
