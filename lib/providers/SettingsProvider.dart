import 'package:state_test/models/Settings.dart';
import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  String _filter = SettingsModel.BY_DAYS;
  double _longitude = SettingsModel.LONG;
  double _latitude = SettingsModel.LAT;
  bool internetConnect = true;

  void setSettings(String filter) {
    _filter = filter;
    notifyListeners();
  }

  void setInternetConnection(bool value) {
    internetConnect = value;
  }

  get isInternetConnection => internetConnect;

  String get filter => _filter;

  void setLocation(double long, double lat) {
    _longitude = long;
    _latitude = lat;
    notifyListeners();
  }

  String get locLong => _longitude.toString();
  String get locLat => _latitude.toString();
}
