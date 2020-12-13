class SettingsModel {
  // filter settings
  static const BY_DAYS = "days";
  static const BY_HOURS = "hours";

  static const LONG = 30.527756;
  static const LAT = 50.434341;

  bool isInternetConnect = true;

  void setInternetConnect(bool status) => isInternetConnect = status;
  bool get internetConnection => isInternetConnect;
}
