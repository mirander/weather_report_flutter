import 'package:intl/intl.dart';
import 'package:weather_report/models/Weather.dart';

class ListWeatherModel {
  List<WeatherModel> listWheather;

  ListWeatherModel({this.listWheather});

  ListWeatherModel.listPrepare(Map<String, dynamic> body) {
    String oldDate = "";
    listWheather = new List<WeatherModel>();
    List<dynamic> data = body['list'].toList();

    data.forEach((value) {
      int temp = (value['main']['temp']).round();

      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(value['dt'] * 1000);
      String date = DateFormat.MMMEd().format(dateTime);

      String icon = "http://openweathermap.org/img/w/" +
          value['weather'].toList()[0]['icon'] +
          ".png";

      listWheather.add(
        WeatherModel(
          nextDay: (oldDate != date) ? true : false,
          intDate: value['dt'],
          description: value['weather'].toList()[0]['description'],
          temp: temp,
          textDate: value['dt_txt'],
          cityName: body['city']['name'],
          date: date,
          time: DateFormat("HH:mm").format(dateTime),
          icon: icon,
        ),
      );
      oldDate = date;
    });
  }
}
