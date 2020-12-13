import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:state_test/components/Cache.dart';
import 'package:state_test/models/ListWeather.dart';
import 'package:state_test/models/Weather.dart';
import 'package:state_test/requests/WheatherRequest.dart';

class WeatherProvider with ChangeNotifier {
  ListWeatherModel listWeather;
  String errorMessage;
  bool _loading = true;
  bool _noSavedData = false;

  Future<bool> fetchWeather(String lat, String long, String lang) async {
    await WheatherRequest(lat, long, lang).fetchWeather().then((data) {
      if (data.statusCode == 200) {
        setWheather(ListWeatherModel.listPrepare(json.decode(data.body)));
        HiveWeather().setWeather(data.body);
      } else {
        Map<String, dynamic> result = json.decode(data.body);
        setMessage(result['message']);
      }
    });
    _setLoading(false);
    return isWeather();
  }

  Future<bool> fetchWeatherOffline() async {
    String jSon = await HiveWeather().getWeather();
    if (jSon != null) {
      setWheather(ListWeatherModel.listPrepare(json.decode(jSon)));
    } else {
      _noSavedData = true;
    }
    _setLoading(false);
    return isWeather();
  }

  bool isWeather() => listWeather != null ? true : false;
  ListWeatherModel getWheather() => listWeather;
  WeatherModel getCurrentWeather() => getWheather().listWheather.first;
  bool getSavedData() => _noSavedData;

  void setWheather(value) {
    listWeather = value;
    notifyListeners();
  }

  void setMessage(String message) {
    errorMessage = message;
    notifyListeners();
  }

  bool isLoading() => _loading;

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
