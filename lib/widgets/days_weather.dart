import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:state_test/models/Weather.dart';
import 'package:state_test/providers/WeatherProvider.dart';
import 'package:state_test/widgets/card_weather.dart';

class WeatherDays extends StatelessWidget {
  final int index;
  const WeatherDays({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    final Weather weather = weatherProvider.listWeather.listWheather[index];

    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(weather.intDate * 1000);
    String time = DateFormat("HH:mm").format(dateTime);
    String date = DateFormat.MMMEd().format(dateTime);

    if (time.contains("15:00"))
      return CardWeather(
        title: date,
        weather: weather,
        date: date,
        time: time,
      );
    else
      return SizedBox();
  }
}
