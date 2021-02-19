import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:ecom_app_flutter/screens/auth/fields.dart';
import 'package:ecom_app_flutter/screens/auth/log_in.dart';
import 'package:ecom_app_flutter/screens/home/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _remember = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Sizing.screenHeight,
            decoration: BoxDecoration(
                gradient: kPrimaryGradientColor
            ),
            padding: EdgeInsets.only(
              top : Sizing.getProportionateScreenHeight(50),
            ),
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizing.getProportionateScreenWidth(25),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5
                          ),
                        ),
                        SizedBox(
                          height: Sizing.getProportionateScreenHeight(8),
                        ),
                        Text(
                          "Join Us",
                          style: TextStyle(
                              fontSize: Sizing.getProportionateScreenWidth(15),
                              fontWeight: FontWeight.w400,
                              color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: Sizing.getProportionateScreenHeight(600),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Sizing.getProportionateScreenWidth(25),
                                vertical: Sizing.getProportionateScreenHeight(30),
                              ),
                              child: Form(
                                child: Column(
                                  children: [
                                    buildEmailFormField(),
                                    SizedBox(height: Sizing.getProportionateScreenHeight(30)),
                                    buildPasswordFormField(),
                                    SizedBox(height: Sizing.getProportionateScreenHeight(30)),
                                    buildPasswordFormField(hint: "Re-enter your password"),
                                  ],
                                ),
                              ),
                            )
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()
                                )
                            );
                          },
                          style: TextButton.styleFrom(
                              enableFeedback: true,
                              padding: EdgeInsets.symmetric(
                                horizontal: Sizing.getProportionateScreenWidth(100),
                                vertical: Sizing.getProportionateScreenHeight(10),
                              ),
                              backgroundColor: kPrimaryColor
                          ),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: Sizing.getProportionateScreenWidth(25),
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            ),
                          ),
                        ),
                        SizedBox(height: Sizing.getProportionateScreenHeight(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account ? ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LogIn()
                                    )
                                );
                              },
                              child: Text(
                                "Log in Here",
                                style: TextStyle(decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Or Sign Up With",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: Sizing.getProportionateScreenHeight(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/gp.png',
                              width: Sizing.getProportionateScreenWidth(50),
                            ),
                            Image.asset(
                              'assets/fb.png',
                              width: Sizing.getProportionateScreenWidth(50),
                            ),
                          ],
                        ),
                        SizedBox(height: Sizing.getProportionateScreenHeight(50)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

