import 'package:flutter/material.dart';

class WheatherItem extends StatelessWidget {
  const WheatherItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Понедельник",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      subtitle: Text("Хмарно"),
      trailing: Text(
        "+10°",
        style: TextStyle(
          fontSize: 22.0,
        ),
      ),
      leading: Container(
        width: 32.0,
        height: 32.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage("assets/images/sun.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
