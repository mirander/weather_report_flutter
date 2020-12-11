import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_test/models/Weather.dart';
import 'package:state_test/providers/WeatherProvider.dart';
import 'package:state_test/widgets/card_weather.dart';

class WeatherHours extends StatelessWidget {
  final int index;
  const WeatherHours({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    final WeatherModel weather =
        weatherProvider.listWeather.listWheather[index];

    CardWeather card = CardWeather(
      title: weather.time,
      weather: weather,
      date: weather.date,
      time: weather.time,
    );

    if (weather.nextDay)
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            alignment: Alignment.centerLeft,
            child: Text("${weather.date}", style: TextStyle(fontSize: 18.0)),
          ),
          card,
        ],
      );
    else
      return card;
  }
}
