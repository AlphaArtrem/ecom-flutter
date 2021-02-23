import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecom_app_flutter/common/bottomNavbar.dart';
import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:ecom_app_flutter/screens/auth/phoneAuth.dart';
import 'package:ecom_app_flutter/screens/home/homeScreen.dart';
import 'package:ecom_app_flutter/screens/wishlist/wishlistScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
            child: Row(
              children: [
                CircleAvatar(
                  radius: Sizing.getProportionateScreenWidth(45.0),
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: Sizing.getProportionateScreenHeight(42.5),
                    backgroundImage: AssetImage(
                      "assets/men.jpg"
                    ),
                  ),
                ),
                SizedBox(width: Sizing.getProportionateScreenWidth(10.0),),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Yash Awasthi",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizing.getProportionateScreenWidth(20),
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                          fontFamily: "arial"
                      ),
                    ),
                    SizedBox(
                      height: Sizing.getProportionateScreenHeight(7.5),
                    ),
                    Text(
                      "+91 9450792132",
                      style: TextStyle(
                          color: Color.fromRGBO(238, 213, 26, 1),
                          fontSize: Sizing.getProportionateScreenWidth(20),
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                          fontFamily: "arial"
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: Sizing.getProportionateScreenHeight(20),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(Sizing.getProportionateScreenWidth(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                    },
                    child: Material(
                      color: Colors.white,
                      shadowColor: kPrimaryColor.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.5)
                      ),
                      elevation: 3.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Sizing.getProportionateScreenWidth(20),
                            vertical: Sizing.getProportionateScreenHeight(12.0)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: kPrimaryColor.shade900,
                              size: Sizing.getProportionateScreenHeight(25.0),
                            ),
                            SizedBox(
                              width: Sizing.getProportionateScreenWidth(15.0),
                            ),
                            Text(
                              "Shipping Addresses",
                              style: TextStyle(
                                  color: kPrimaryColor.shade900,
                                  fontSize: Sizing.getProportionateScreenWidth(18.5),
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizing.getProportionateScreenHeight(20),
                  ),
                  InkWell(
                    onTap: (){
                    },
                    child: Material(
                      color: Colors.white,
                      shadowColor: kPrimaryColor.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.5)
                      ),
                      elevation: 3.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Sizing.getProportionateScreenWidth(20),
                            vertical: Sizing.getProportionateScreenHeight(12.0)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.credit_card_outlined,
                              color: kPrimaryColor.shade900,
                              size: Sizing.getProportionateScreenHeight(25.0),
                            ),
                            SizedBox(
                              width: Sizing.getProportionateScreenWidth(15.0),
                            ),
                            Text(
                              "Payment Methods",
                              style: TextStyle(
                                  color: kPrimaryColor.shade900,
                                  fontSize: Sizing.getProportionateScreenWidth(18.5),
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizing.getProportionateScreenHeight(20),
                  ),
                  InkWell(
                    onTap: (){
                    },
                    child: Material(
                      color: Colors.white,
                      shadowColor: kPrimaryColor.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.5)
                      ),
                      elevation: 3.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Sizing.getProportionateScreenWidth(20),
                            vertical: Sizing.getProportionateScreenHeight(12.0)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.event_note_outlined,
                              color: kPrimaryColor.shade900,
                              size: Sizing.getProportionateScreenHeight(25.0),
                            ),
                            SizedBox(
                              width: Sizing.getProportionateScreenWidth(15.0),
                            ),
                            Text(
                              "Orders",
                              style: TextStyle(
                                  color: kPrimaryColor.shade900,
                                  fontSize: Sizing.getProportionateScreenWidth(18.5),
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
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
                          builder: (context) => WishlistScreen()
                        )
                      );
                    },
                    child: Material(
                      color: Colors.white,
                      shadowColor: kPrimaryColor.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.5)
                      ),
                      elevation: 3.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Sizing.getProportionateScreenWidth(20),
                            vertical: Sizing.getProportionateScreenHeight(12.0)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: kPrimaryColor.shade900,
                              size: Sizing.getProportionateScreenHeight(25.0),
                            ),
                            SizedBox(
                              width: Sizing.getProportionateScreenWidth(15.0),
                            ),
                            Text(
                              "Favourite",
                              style: TextStyle(
                                  color: kPrimaryColor.shade900,
                                  fontSize: Sizing.getProportionateScreenWidth(18.5),
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizing.getProportionateScreenHeight(20),
                  ),
                  InkWell(
                    onTap: (){
                    },
                    child: Material(
                      color: Colors.white,
                      shadowColor: kPrimaryColor.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.5)
                      ),
                      elevation: 3.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Sizing.getProportionateScreenWidth(20),
                            vertical: Sizing.getProportionateScreenHeight(12.0)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.settings,
                              color: kPrimaryColor.shade900,
                              size: Sizing.getProportionateScreenHeight(25.0),
                            ),
                            SizedBox(
                              width: Sizing.getProportionateScreenWidth(15.0),
                            ),
                            Text(
                              "Settings",
                              style: TextStyle(
                                  color: kPrimaryColor.shade900,
                                  fontSize: Sizing.getProportionateScreenWidth(18.5),
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
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
                          CupertinoPageRoute(builder: (context) => PhoneAuth())
                      );
                    },
                    child: Material(
                      color: Colors.white,
                      shadowColor: kPrimaryColor.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.5)
                      ),
                      elevation: 3.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Sizing.getProportionateScreenWidth(20),
                            vertical: Sizing.getProportionateScreenHeight(12.0)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.logout,
                              color: kPrimaryColor.shade900,
                              size: Sizing.getProportionateScreenHeight(25.0),
                            ),
                            SizedBox(
                              width: Sizing.getProportionateScreenWidth(15.0),
                            ),
                            Text(
                              "Log Out",
                              style: TextStyle(
                                  color: kPrimaryColor.shade900,
                                  fontSize: Sizing.getProportionateScreenWidth(18.5),
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizing.getProportionateScreenHeight(20),
                  ),
                ]
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: 3,)
    );
  }

}
