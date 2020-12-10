import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:state_test/models/Weather.dart';
import 'package:state_test/providers/WeatherProvider.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel weather;
    final curWeather = Provider.of<WeatherProvider>(context, listen: false);

    if (curWeather.isWeather()) weather = curWeather.getCurrentWeather();

    return Column(
      children: [
        _currentDate(),
        SizedBox(
          height: 40.0,
        ),
        (weather != null)
            ? Container(
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "${weather.temp}°",
                        style: TextStyle(
                          fontSize: 80.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        "${weather.cityName}".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "${weather.description}".toUpperCase(),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red[400]),
              ),
      ],
    );
  }

  Widget _currentDate() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 10.0),
      child: Text(DateFormat.yMMMEd().format(DateTime.now())),
    );
  }
}
