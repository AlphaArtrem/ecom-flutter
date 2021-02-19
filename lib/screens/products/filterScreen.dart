import 'dart:math';
import 'package:ecom_app_flutter/common/bottomNavbar.dart';
import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:ecom_app_flutter/static/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Sizing.getProportionateScreenWidth(10)
                  ),
                  width: Sizing.screenWidth,
                  height: Sizing.screenHeight * 0.15,
                  decoration: BoxDecoration(
                      gradient: kPrimaryGradientColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: Sizing.getProportionateScreenHeight(25),
                          ),
                          onPressed: (){
                            Navigator.of(context).pop();
                          }
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Filter",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizing.getProportionateScreenWidth(20),
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.white,
                            size: Sizing.getProportionateScreenHeight(20),
                          ),
                          onPressed: (){}
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: Sizing.screenHeight * 0.12,
                    left: Sizing.screenWidth * 0.05,
                    right: Sizing.screenWidth * 0.05,
                  ),
                  height: Sizing.getProportionateScreenHeight(50),
                  child: Material(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    elevation: 2.5,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: Sizing.getProportionateScreenWidth(12),
                              top: Sizing.getProportionateScreenHeight(4)
                          ),
                          child: Icon(
                            Icons.search_sharp,
                            color: Colors.grey,
                            size: Sizing.getProportionateScreenWidth(35),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: Sizing.getProportionateScreenWidth(12),
                                top: Sizing.getProportionateScreenHeight(2.5)
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "What are you looking for ?",
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  )
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Sizing.getProportionateScreenHeight(15.0),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: 1),
    );
  }
}