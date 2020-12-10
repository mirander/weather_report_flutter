import 'package:state_test/models/Settings.dart';
import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  String _settings = SettingsModel.BY_DAYS;

  void setSettings(String filter) {
    _settings = filter;
    notifyListeners();
  }

  String get filter => _settings;
}
