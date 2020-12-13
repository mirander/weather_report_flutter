import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_report/models/Weather.dart';
import 'package:weather_report/providers/WeatherProvider.dart';
import 'package:weather_report/widgets/card_weather.dart';

class WeatherDays extends StatelessWidget {
  final int index;
  const WeatherDays({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    final WeatherModel weather =
        weatherProvider.listWeather.listWheather[index];

    if (weather.nextDay)
      return CardWeather(
        title: weather.date,
        weather: weather,
        date: weather.date,
        time: weather.time,
      );
    else
      return SizedBox();
  }
}
