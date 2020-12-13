import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:state_test/components/InitApp.dart';
import 'package:state_test/providers/WeatherProvider.dart';
import 'package:state_test/widgets/current_weather.dart';
import 'package:state_test/widgets/filter.dart';
import 'package:state_test/widgets/list_weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InitApp(context);
    final weather = Provider.of<WeatherProvider>(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red[400],
            title: Text(FlutterI18n.translate(context, "appTitle")),
            actions: [Filter()],
          ),
          body: (!weather.getSavedData())
              ? SingleChildScrollView(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CurrentWeather(),
                      SizedBox(height: 50),
                      WeatherList(),
                    ],
                  ),
                )
              : _noDataApp(context)),
    );
  }

  Widget _noDataApp(BuildContext context) {
    return Align(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/wifi.png",
            width: 150,
            height: 140,
          ),
          Text(
            FlutterI18n.translate(context, "noInternetConnection"),
            style: TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            FlutterI18n.translate(context, "noSaveData"),
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
