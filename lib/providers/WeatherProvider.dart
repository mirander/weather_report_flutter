import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:state_test/models/ListWeather.dart';
import 'package:state_test/models/Weather.dart';
import 'package:state_test/requests/WheatherRequest.dart';

class WeatherProvider with ChangeNotifier {
  ListWeatherModel listWeather;
  String errorMessage;
  bool _loading = true;

  Future<bool> fetchWeather(String cord) async {
    if (isLoading()) {
      await WheatherRequest(cord).fetchWeather().then((data) {
        if (data.statusCode == 200) {
          setWheather(ListWeatherModel.listPrepare(json.decode(data.body)));
        } else {
          Map<String, dynamic> result = json.decode(data.body);
          setMessage(result['message']);
        }
      });
    }
    _setLoading(false);
    return isWeather();
  }

  bool isWeather() => listWeather != null ? true : false;

  ListWeatherModel getWheather() => listWeather;

  WeatherModel getCurrentWeather() => getWheather().listWheather.first;

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
