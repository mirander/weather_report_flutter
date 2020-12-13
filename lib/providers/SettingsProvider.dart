import 'package:state_test/models/Settings.dart';
import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  String _filter = SettingsModel.BY_DAYS;
  double _longitude;
  double _latitude;
  bool _isLocate = false;

  void setLocate(bool value) {
    _isLocate = value;
    notifyListeners();
  }

  bool isLocateSet() => _isLocate;

  void setSettings(String filter) {
    _filter = filter;
    notifyListeners();
  }

  String get filter => _filter;

  void setLocation(double long, double lat) {
    _longitude = long;
    _latitude = lat;
    _isLocate = true;
    notifyListeners();
  }

  String get locLong => _longitude.toString();
  String get locLat => _latitude.toString();
}
