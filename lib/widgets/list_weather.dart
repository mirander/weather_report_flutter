import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    List<Weather> list;
    final weather = Provider.of<WeatherProvider>(context, listen: false);
    final settings = Provider.of<SettingsProvider>(context);

    if (weather.isWeather()) list = weather.getWheather().listWheather;

    return (weather.isWeather())
        ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              if (settings.filter.contains(Settings.BY_DAYS))
                return WeatherDays(index: index);
              else
                return WeatherHours(index: index);
            })
        : CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red[400]),
          );
  }
}
