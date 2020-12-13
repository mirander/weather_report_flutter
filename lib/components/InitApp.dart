import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connectivity/connectivity.dart';
import 'package:weather_report/components/Geolocation.dart';
import 'package:weather_report/providers/SettingsProvider.dart';
import 'package:weather_report/providers/WeatherProvider.dart';

class InitApp {
  bool initApp = false;

  InitApp(BuildContext context) {
    final currentLang = Platform.localeName.split("_")[0];
    final weather = Provider.of<WeatherProvider>(context);
    final settings = Provider.of<SettingsProvider>(context);

    _isInternet().then((value) {
      if (value) {
        _isLocate(settings);
        if (weather.isLoading() && settings.isLocateSet()) {
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

  void _isLocate(SettingsProvider settings) {
    if (!settings.isLocateSet()) {
      try {
        Geolocation.determinePosition().then((value) {
          settings.setLocation(value.longitude, value.latitude);
        }).catchError((e) {
          settings.setLocation(30.527756, 50.434341);
        });
      } on Exception catch (_) {
        print("Something wrong...");
      }
    }
  }
}
