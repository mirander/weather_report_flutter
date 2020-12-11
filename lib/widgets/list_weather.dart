import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:state_test/models/Settings.dart';
import 'package:state_test/models/Weather.dart';
import 'package:state_test/providers/SettingsProvider.dart';
import 'package:state_test/providers/WeatherProvider.dart';
import 'package:state_test/widgets/hours_weather.dart';
import 'days_weather.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 10.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              (settings.filter.contains(SettingsModel.BY_DAYS))
                  ? FlutterI18n.translate(context, "filterDay").toUpperCase()
                  : FlutterI18n.translate(context, "filterHours").toUpperCase(),
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _weatherList(context, settings),
        ],
      ),
    );
  }

  Widget _weatherList(BuildContext context, SettingsProvider settings) {
    List<WeatherModel> list;
    final weather = Provider.of<WeatherProvider>(context, listen: false);

    if (weather.isWeather()) list = weather.getWheather().listWheather;
    return (weather.isWeather())
        ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              if (settings.filter.contains(SettingsModel.BY_DAYS)) {
                return WeatherDays(index: index);
              } else {
                return WeatherHours(index: index);
              }
            })
        : CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red[400]),
          );
  }
}
