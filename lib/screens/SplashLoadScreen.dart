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
      seconds: 5,
      navigateAfterSeconds: new HomeScreen(),
      title: Text(
        FlutterI18n.translate(context, "appTitle"),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      image: Image.asset(
        "assets/images/start-logo.jpg",
      ),
      photoSize: 100.0,
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
}
