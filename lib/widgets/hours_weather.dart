import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
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

    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(weather.intDate * 1000);
    String time = DateFormat("HH:mm").format(dateTime);
    String date = DateFormat.MMMEd().format(dateTime);

    CardWeather card = CardWeather(
      title: time,
      weather: weather,
      date: date,
      time: time,
    );

    if (time.contains("00:00")) {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            alignment: Alignment.centerLeft,
            child: Text("$date", style: TextStyle(fontSize: 18.0)),
          ),
          card,
        ],
      );
    } else {
      return card;
    }
  }
}
