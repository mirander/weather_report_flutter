import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:state_test/providers/WeatherProvider.dart';
import 'package:state_test/widgets/current_weather.dart';
import 'package:state_test/widgets/list_weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const BY_DAYS = "days";
    const BY_HOURS = "hours";

    String _value = BY_DAYS;

    final weather = Provider.of<WeatherProvider>(context);
    Future.delayed(Duration.zero, () async {
      weather.fetchWeather("lat=49.988358&lon=36.232845");
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          title: Text(FlutterI18n.translate(context, "appTitle")),
          actions: [
            new DropdownButton<String>(
              value: _value,
              items: <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  child: Text(
                    FlutterI18n.translate(context, "filterDay"),
                  ),
                  value: BY_DAYS,
                ),
                DropdownMenuItem(
                  child: Text(
                    FlutterI18n.translate(context, "filterHours"),
                  ),
                  value: BY_HOURS,
                ),
              ],
              onChanged: (String value) {
                print("OK");
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CurrentWeather(),
              SizedBox(
                height: 50,
              ),
              Container(
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
                        "По часам".toUpperCase(),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    WeatherList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
