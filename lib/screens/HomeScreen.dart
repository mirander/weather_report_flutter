import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:state_test/models/Settings.dart';
import 'package:state_test/providers/SettingsProvider.dart';
import 'package:state_test/providers/WeatherProvider.dart';
import 'package:state_test/widgets/current_weather.dart';
import 'package:state_test/widgets/filter.dart';
import 'package:state_test/widgets/list_weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<WeatherProvider>(context);
    final settings = Provider.of<SettingsProvider>(context);
    Future.delayed(Duration.zero, () async {
      weather.fetchWeather("lat=49.988358&lon=36.232845");
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          title: Text(FlutterI18n.translate(context, "appTitle")),
          actions: [Filter()],
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
                        (settings.filter.contains(Settings.BY_DAYS))
                            ? FlutterI18n.translate(context, "filterDay")
                                .toUpperCase()
                            : FlutterI18n.translate(context, "filterHours")
                                .toUpperCase(),
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
