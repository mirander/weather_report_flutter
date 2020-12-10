import 'package:state_test/models/Weather.dart';

class ListWeather {
  List<Weather> listWheather;

  ListWeather({this.listWheather});

  ListWeather.listPrepare(Map<String, dynamic> body) {
    listWheather = new List<Weather>();
    List<dynamic> data = body['list'].toList();

    data.forEach((value) {
      listWheather.add(Weather(
        intDate: value['dt'],
        description: value['weather'].toList()[0]['description'],
        temp: value['main']['temp'],
        textDate: value['dt_txt'],
        cityName: body['city']['name'],
      ));
    });
  }
}
