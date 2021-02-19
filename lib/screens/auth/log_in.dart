import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:ecom_app_flutter/screens/auth/fields.dart';
import 'package:ecom_app_flutter/screens/auth/sign_up.dart';
import 'package:ecom_app_flutter/screens/home/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
                          "Log In",
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
                          "Welcome Back",
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
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _remember,
                                          activeColor: kPrimaryColor,
                                          onChanged: (value) {
                                            setState(() {
                                              _remember = value;
                                            });
                                          },
                                        ),
                                        Text("Remember me"),
                                        Spacer(),
                                        GestureDetector(
                                          child: Text(
                                            "Forgot Password",
                                            style: TextStyle(decoration: TextDecoration.underline),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(
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
                            "Login",
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
                              "Don't have an account ? ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()
                                  )
                                );
                              },
                              child: Text(
                                "Sign Up Here",
                                style: TextStyle(decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Or Login With",
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

