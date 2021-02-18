import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:ecom_app_flutter/screens/auth/log_in.dart';
import 'package:ecom_app_flutter/screens/auth/phoneAuth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Sizing().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Sizing.screenHeight,
            width: Sizing.screenWidth,
            child: Image.asset(
              "assets/splash.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: Sizing.screenHeight,
            width: Sizing.screenWidth,
            color: kPrimaryColor.withOpacity(0.25),
          ),
          Container(
            margin: EdgeInsets.only(
              top: Sizing.screenHeight * 0.575,
              left: Sizing.screenWidth * 0.35
            ),
            decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100)
              )
            ),
            child: Container(),
          ),
          Container(
            margin: EdgeInsets.only(
                top: Sizing.screenHeight * 0.65,
            ),
            decoration: BoxDecoration(
                gradient: kPrimaryGradientColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                )
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizing.getProportionateScreenWidth(50),
                vertical: Sizing.getProportionateScreenHeight(30)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Quickie",
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: Sizing.getProportionateScreenWidth(25),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "Shop",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizing.getProportionateScreenWidth(25),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Sizing.getProportionateScreenHeight(20),
                  ),
                  Flexible(
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizing.getProportionateScreenWidth(14),
                        fontWeight: FontWeight.w400
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: Sizing.getProportionateScreenHeight(40),
                  ),
                  MaterialButton(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: (){
                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => PhoneAuth()
                          )
                      );
                    },
                    color: Color.fromRGBO(238, 213, 26, 1),
                    textColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                       horizontal: Sizing.getProportionateScreenWidth(40)
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizing.getProportionateScreenWidth(15),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
