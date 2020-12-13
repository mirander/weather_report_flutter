import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_test/providers/SettingsProvider.dart';
import 'package:state_test/providers/WeatherProvider.dart';
import 'package:connectivity/connectivity.dart';

class InitApp {
  bool initApp = false;

  InitApp(BuildContext context) {
    final currentLang = Platform.localeName.split("_")[0];
    final weather = Provider.of<WeatherProvider>(context);
    final settings = Provider.of<SettingsProvider>(context);

    _isInternet().then((value) {
      if (value) {
        if (weather.isLoading()) {
          weather.fetchWeather(
            settings.locLat,
            settings.locLong,
            currentLang,
          );
        }
      } else {
        weather.fetchWeatherOffline();
      }
    });
  }

  Future<bool> _isInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none)
      return false;
    else
      return true;
  }
}
