import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:state_test/widgets/weather_item.dart';
import 'package:state_test/widgets/current_weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const BY_DAYS = "days";
    const BY_HOURS = "hours";

    String _value = BY_DAYS;

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
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "По дням".toUpperCase(),
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: [
                  WheatherItem(),
                  WheatherItem(),
                  WheatherItem(),
                  WheatherItem(),
                  WheatherItem(),
                  WheatherItem(),
                  WheatherItem(),
                  WheatherItem(),
                  WheatherItem(),
                  WheatherItem(),
                  WheatherItem(),
                  WheatherItem(),
                  WheatherItem(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
