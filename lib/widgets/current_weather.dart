import 'package:flutter/material.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 10.0),
          child: Text("Понедельник, Декабрь 2020"),
        ),
        SizedBox(
          height: 40.0,
        ),
        Container(
          child: Column(
            children: [
              Container(
                child: Text(
                  "30°",
                  style: TextStyle(
                    fontSize: 80.0,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  "Харьков".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Пасмурно, возможно дождь".toUpperCase(),
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
