import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical : Sizing.getProportionateScreenHeight(50),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      "QuikieShops",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: Sizing.getProportionateScreenWidth(25),
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5
                      ),
                    ),
                    SizedBox(
                      height: Sizing.getProportionateScreenHeight(8),
                    ),
                    Text(
                      "Shop Quick. Shop Smart.",
                      style: TextStyle(
                        fontSize: Sizing.getProportionateScreenWidth(15),
                        fontWeight: FontWeight.w400,
                        color: Colors.grey
                      ),
                    ),
                    SizedBox(
                      height: Sizing.getProportionateScreenHeight(50),
                    ),
                    Expanded(
                      child: PageView.builder(
                        itemCount: 3,
                        onPageChanged: (index){
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index){
                          return SvgPicture.asset(
                            "assets/splash_${index + 1}.svg",
                          );
                        },
                      ),
                    )
                  ],
                )
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SizedBox(
                      height: Sizing.getProportionateScreenHeight(30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index){
                        return AnimatedContainer(
                          duration: kAnimationDuration,
                          margin: EdgeInsets.only(right: Sizing.getProportionateScreenWidth(5)),
                          height: Sizing.getProportionateScreenHeight(6),
                          width: Sizing.getProportionateScreenWidth(
                            _currentIndex == index ? 20 : 6
                          ),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(3)
                          ),
                        );
                      }),
                    ),
                    Expanded(child: Container()),
                    TextButton(
                      style: TextButton.styleFrom(
                        enableFeedback: true,
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizing.getProportionateScreenWidth(100),
                          vertical: Sizing.getProportionateScreenHeight(10),
                        ),
                        backgroundColor: kPrimaryColor
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            fontSize: Sizing.getProportionateScreenWidth(25),
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
