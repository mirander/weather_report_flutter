import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:state_test/screens/HomeScreen.dart';

class SplashLoadScreen extends StatefulWidget {
  SplashLoadScreen({Key key}) : super(key: key);

  @override
  _SplashLoadScreenState createState() => _SplashLoadScreenState();
}

class _SplashLoadScreenState extends State<SplashLoadScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new HomeScreen(),
      title: Text(
        FlutterI18n.translate(context, "appTitle"),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28.0,
          color: Colors.red[400],
        ),
      ),
      image: Image.asset(
        "assets/images/sun-icon-animation.gif",
      ),
      photoSize: 100.0,
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
}
