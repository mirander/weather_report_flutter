import 'package:state_test/models/Settings.dart';
import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  String _settings = SettingsModel.BY_DAYS;

  double _longitude = 30.527756;
  double _latitude = 50.434341;

  void setSettings(String filter) {
    _settings = filter;
    notifyListeners();
  }

  String get filter => _settings;

  void setLocation(double long, double lat) {
    _longitude = long;
    _latitude = lat;
    notifyListeners();
  }

  String get locLong => _longitude.toString();
  String get locLat => _latitude.toString();
}
