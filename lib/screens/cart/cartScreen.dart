import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_app_flutter/common/bottomNavbar.dart';
import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:ecom_app_flutter/screens/home/homeScreen.dart';
import 'package:ecom_app_flutter/screens/products/productDetails.dart';
import 'package:ecom_app_flutter/static/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Sizing.getProportionateScreenWidth(10),
                  top: Sizing.getProportionateScreenHeight(25.0)
              ),
              width: Sizing.screenWidth,
              height: Sizing.screenHeight * 0.125,
              decoration: BoxDecoration(
                  gradient: kPrimaryGradientColor
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: Sizing.getProportionateScreenHeight(25),
                      ),
                      onPressed: (){
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => HomeScreen()
                            )
                        );
                      }
                  ),
                  Expanded(child: Container(), flex: 2,),
                  Text(
                    "Cart",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizing.getProportionateScreenWidth(20),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Expanded(child: Container(), flex: 2,),
                  TextButton(
                      child: Text(
                        "Clear",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizing.getProportionateScreenWidth(15),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: (){
                        cart = [];
                        setState(() {});
                      }
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: cart.length,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: Sizing.getProportionateScreenHeight(0.5)
                        ),
                        child: Dismissible(
                          background: Container(
                            color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(child: Container()),
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: Sizing.getProportionateScreenHeight(25.0),
                                ),
                                SizedBox(width: Sizing.getProportionateScreenWidth(15.0),)
                              ],
                            ),
                          ),
                          key: UniqueKey(),
                          onDismissed: (direction){
                            setState(() {
                              cart.removeAt(index);
                            });
                          },
                          child: Material(
                            elevation: 2.0,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Sizing.getProportionateScreenWidth(15.0)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap:(){
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) => ProductDetails(
                                                product: cart[index],
                                              )
                                          )
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: Sizing.getProportionateScreenWidth(5),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Sizing.getProportionateScreenWidth(20),
                                          vertical: Sizing.getProportionateScreenHeight(15)
                                      ),
                                      height: Sizing.getProportionateScreenHeight(140),
                                      width: Sizing.getProportionateScreenWidth(120),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7.0),
                                        image: DecorationImage(
                                          image: AssetImage(cart[index].images[0]),
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Sizing.getProportionateScreenWidth(10.0),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: Sizing.getProportionateScreenHeight(700 / cart[index].title.length),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            cart[index].title,
                                            style: TextStyle(
                                                color: kPrimaryColor.shade900,
                                                fontSize: Sizing.getProportionateScreenWidth(14),
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            "\$" + cart[index].price.toString(),
                                            style: TextStyle(
                                                color: kPrimaryColor.shade900,
                                                fontSize: Sizing.getProportionateScreenWidth(18),
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: Sizing.getProportionateScreenWidth(10.0),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Icon(Icons.add_circle_outline),
                                        color: Colors.grey,
                                        iconSize: Sizing.getProportionateScreenHeight(20.0),
                                        onPressed: (){
                                          setState(() {
                                            cart[index].cartValue += 1;
                                          });
                                        },
                                      ),
                                      Text(
                                        cart[index].cartValue.toString(),
                                        style: TextStyle(
                                            color: Colors.grey.withOpacity(0.75),
                                            fontSize: Sizing.getProportionateScreenWidth(16),
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Icon(Icons.remove_circle_outline),
                                        color: Colors.grey,
                                        iconSize: Sizing.getProportionateScreenHeight(20.0),
                                        onPressed: (){
                                          setState(() {
                                            cart[index].cartValue -= 1;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                )
            )
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Sizing.getProportionateScreenWidth(7.5),
            vertical: Sizing.getProportionateScreenHeight(10.0)
        ),
        height: Sizing.getProportionateScreenHeight(120.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Sizing.getProportionateScreenWidth(13.0)),
                  child: Text(
                    "Total Price",
                    style: TextStyle(
                        color: kPrimaryColor.shade900,
                        fontSize: Sizing.getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: EdgeInsets.only(right: Sizing.getProportionateScreenWidth(13.0)),
                  child: Text(
                    "\$" + (cart.isEmpty ? "0" : totalCartValue()),
                    style: TextStyle(
                        color: kPrimaryColor.shade900,
                        fontSize: Sizing.getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Sizing.getProportionateScreenHeight(15.0),
            ),
            MaterialButton(
              minWidth: Sizing.screenWidth * 0.9,
              height: Sizing.getProportionateScreenHeight(50),
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              onPressed: (){
              },
              color: Color.fromRGBO(238, 213, 26, 1),
              textColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizing.getProportionateScreenWidth(40),
                  vertical: Sizing.getProportionateScreenHeight(10),
                ),
                child: Text(
                  "Check Out",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizing.getProportionateScreenWidth(18.0),
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String totalCartValue(){
  double total = 0;
  cart.forEach((element) {
    total += element.price * element.cartValue;
  });
  return total.toStringAsFixed(2);
}