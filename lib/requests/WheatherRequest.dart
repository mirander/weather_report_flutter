import 'package:http/http.dart' as http;

class WheatherRequest {
  // tokens
  // 624a9a1570a103dc9ffbd7331003b20d
  // 035f404367ee0f071bcef0d52e0c86e5

  String cord = "lat=50.434341&lon=30.527756"; // Default {Kiew}
  final String url = "https://api.openweathermap.org/data/2.5/";
  final String token = "&appid=624a9a1570a103dc9ffbd7331003b20d";

  WheatherRequest(this.cord);

  Future<http.Response> fetchWeather() =>
      http.get(url + "forecast?" + cord + token + "&units=metric&lang=ru");
}
