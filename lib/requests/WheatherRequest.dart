import 'package:http/http.dart' as http;

class WheatherRequest {
  // tokens
  // 624a9a1570a103dc9ffbd7331003b20d
  // 035f404367ee0f071bcef0d52e0c86e5

  String lat;
  String long;
  String lang;
  final String url = "https://api.openweathermap.org/data/2.5/";
  final String token = "&appid=624a9a1570a103dc9ffbd7331003b20d";

  WheatherRequest(this.lat, this.long, this.lang);

  Future<http.Response> fetchWeather() => http.get(url +
      "forecast?lat=" +
      lat +
      "&lon=" +
      long +
      "&token=" +
      token +
      "&lang=" +
      lang +
      "&units=metric&cnt=30");
}
