 import 'package:ecom_app_flutter/common/styles.dart';
import 'package:ecom_app_flutter/screens/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(EComApp());

class EComApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Com App",
      theme: ThemeData(
          canvasColor: Colors.transparent,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: kPrimaryColor
          ),
          bodyText2: TextStyle(
              color: kPrimaryColor
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

