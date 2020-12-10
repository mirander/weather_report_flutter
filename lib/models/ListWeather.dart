import 'package:state_test/models/Weather.dart';

class ListWeatherModel {
  List<WeatherModel> listWheather;

  ListWeatherModel({this.listWheather});

  ListWeatherModel.listPrepare(Map<String, dynamic> body) {
    listWheather = new List<WeatherModel>();
    List<dynamic> data = body['list'].toList();

    data.forEach((value) {
      int temp = (value['main']['temp']).round();

      listWheather.add(WeatherModel(
        intDate: value['dt'],
        description: value['weather'].toList()[0]['description'],
        temp: temp,
        textDate: value['dt_txt'],
        cityName: body['city']['name'],
      ));
    });
  }
}
