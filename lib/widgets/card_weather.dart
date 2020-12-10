import 'package:flutter/material.dart';
import 'package:state_test/models/Weather.dart';

class CardWeather extends StatelessWidget {
  final WeatherModel weather;
  final String title;
  final String date;
  final String time;
  const CardWeather({Key key, this.weather, this.title, this.date, this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("Tap :) "),
      child: Card(
        margin: const EdgeInsets.only(bottom: 10.0),
        elevation: 2,
        child: ListTile(
          title: Text(
            "$title",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          subtitle: Text("${weather.description}"),
          trailing: Text(
            "${weather.temp}°",
            style: TextStyle(fontSize: 22.0),
          ),
          leading: Container(
            width: 32.0,
            height: 32.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("assets/images/sun.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
