import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:ecom_app_flutter/screens/home/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneAuth extends StatefulWidget {
  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  int _phoneNumber = 9415452686;
  CountryCode _code;
  bool _enterNumberState = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _enterNumberState ? _enterNumberForm() : _enterOTPState(),
    );
  }

  Widget _enterNumberForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(
            left: Sizing.getProportionateScreenWidth(20),
            top: Sizing.getProportionateScreenWidth(20),
          ),
          height: Sizing.screenHeight * 0.22,
          width: Sizing.screenWidth,
          decoration: BoxDecoration(
              gradient: kPrimaryGradientColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(170)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What Is Your Phone",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizing.getProportionateScreenWidth(25),
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                    fontFamily: "arial"
                ),
              ),
              Text(
                "Number?",
                style: TextStyle(
                    color: Color.fromRGBO(238, 213, 26, 1),
                    fontSize: Sizing.getProportionateScreenWidth(25),
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                    fontFamily: "arial"
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Sizing.getProportionateScreenHeight(20),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(Sizing.getProportionateScreenWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Please enter your phone number to verify your account",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizing.getProportionateScreenWidth(15),
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.none,
                        fontFamily: "arial"
                    ),
                  ),
                  SizedBox(
                    height: Sizing.getProportionateScreenHeight(20),
                  ),
                  Container(
                    padding: EdgeInsets.all(Sizing.getProportionateScreenWidth(5.0)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                            color: Colors.grey.shade300,
                            width: Sizing.getProportionateScreenWidth(0.5
                            )
                        )
                    ),
                    child: Row(
                      children: [
                        CountryCodePicker(
                          onChanged: (code){
                            _code = code;
                          },
                          onInit: (code){
                            _code = code;
                          },
                          dialogTextStyle: TextStyle(
                              color: Colors.black45
                          ),
                          initialSelection: 'IN',
                          favorite: ['+91','IN'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                        SizedBox(width: Sizing.getProportionateScreenWidth(5),),
                        Expanded(
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: _phoneNumber.toString(),
                                hintStyle: TextStyle(color: Colors.grey)
                            ),
                            initialValue: "",
                            keyboardType: TextInputType.phone,
                            onChanged: (val){
                              _phoneNumber = int.parse(val);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Sizing.getProportionateScreenHeight(20),
                  ),
                  MaterialButton(
                    elevation: 0.0,
                    minWidth: Sizing.screenWidth * 0.9,
                    height: Sizing.getProportionateScreenHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: (){
                      setState(() {
                        _enterNumberState = false;
                      });
                    },
                    color: Color.fromRGBO(238, 213, 26, 1),
                    textColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizing.getProportionateScreenWidth(40),
                        vertical: Sizing.getProportionateScreenHeight(10),
                      ),
                      child: Text(
                        "Send Verification Code",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizing.getProportionateScreenWidth(15),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizing.getProportionateScreenHeight(20),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => HomeScreen()
                          )
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: Sizing.getProportionateScreenWidth(15),
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                          fontFamily: "arial"
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _enterOTPState(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(
            left: Sizing.getProportionateScreenWidth(20),
            top: Sizing.getProportionateScreenWidth(20),
          ),
          height: Sizing.screenHeight * 0.22,
          width: Sizing.screenWidth,
          decoration: BoxDecoration(
              gradient: kPrimaryGradientColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(170)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verification",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizing.getProportionateScreenWidth(25),
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                    fontFamily: "arial"
                ),
              ),
              Text(
                "Code",
                style: TextStyle(
                    color: Color.fromRGBO(238, 213, 26, 1),
                    fontSize: Sizing.getProportionateScreenWidth(25),
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                    fontFamily: "arial"
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Sizing.getProportionateScreenHeight(20),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(Sizing.getProportionateScreenWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Please enter code sent to",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Sizing.getProportionateScreenWidth(15),
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.none,
                            fontFamily: "arial"
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${_code.dialCode} $_phoneNumber",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Sizing.getProportionateScreenWidth(15),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            fontFamily: "arial"
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          setState(() {
                            _enterNumberState = true;
                          });
                        },
                        child: Text(
                          "Change Phone Number",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Sizing.getProportionateScreenWidth(12),
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              fontFamily: "arial"
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Sizing.getProportionateScreenHeight(20),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Sizing.getProportionateScreenWidth(25)
                    ),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        inactiveFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        shape: PinCodeFieldShape.underline,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: Sizing.getProportionateScreenHeight(40),
                        fieldWidth: Sizing.getProportionateScreenWidth(40),
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      onCompleted: (v) {
                      },
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                  ),
                  SizedBox(
                    height: Sizing.getProportionateScreenHeight(20),
                  ),
                  MaterialButton(
                    minWidth: Sizing.screenWidth * 0.9,
                    height: Sizing.getProportionateScreenHeight(50),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: (){
                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => HomeScreen()
                          )
                      );
                    },
                    color: Color.fromRGBO(238, 213, 26, 1),
                    textColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizing.getProportionateScreenWidth(40),
                        vertical: Sizing.getProportionateScreenHeight(10),
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizing.getProportionateScreenWidth(15),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizing.getProportionateScreenHeight(20),
                  ),
                  InkWell(
                    onTap: () async{
                      await Fluttertoast.showToast(
                          msg: "OTP has been re-sent.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: kPrimaryColor,
                          textColor: Colors.white,
                          fontSize: Sizing.getProportionateScreenWidth(15)
                      );
                    },
                    child: Text(
                      "Resend Code",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: Sizing.getProportionateScreenWidth(15),
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                          fontFamily: "arial"
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

}
