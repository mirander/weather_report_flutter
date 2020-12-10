import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:state_test/providers/WeatherProvider.dart';
import 'package:state_test/widgets/current_weather.dart';
import 'package:state_test/widgets/filter.dart';
import 'package:state_test/widgets/list_weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<WeatherProvider>(context);
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
              SizedBox(height: 50),
              WeatherList(),
            ],
          ),
        ),
      ),
    );
  }
}
