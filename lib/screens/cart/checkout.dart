import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:ecom_app_flutter/screens/cart/cartScreen.dart';
import 'package:ecom_app_flutter/screens/home/homeScreen.dart';
import 'package:ecom_app_flutter/static/address.dart';
import 'package:ecom_app_flutter/static/cardDetails.dart';
import 'package:ecom_app_flutter/static/courier.dart';
import 'package:ecom_app_flutter/static/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Address address = addresses[0];
  CreditCardModel creditCardModel = creditCards[0];
  int selectedCourierService = 0;
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
                        Navigator.pop(context);
                      }
                  ),
                  Expanded(child: Container(), flex: 2,),
                  Text(
                    "Check Out",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizing.getProportionateScreenWidth(20),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Expanded(child: Container(), flex: 3,),
                ]
              ),
            ),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Sizing.getProportionateScreenWidth(20),
                  ),
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Sizing.getProportionateScreenWidth(10),
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
                          elevation: 1.5,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Sizing.getProportionateScreenWidth(20),
                                vertical: Sizing.getProportionateScreenHeight(12.0)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      address.toStringList()[0],
                                      style: TextStyle(
                                          color: kPrimaryColor.shade900,
                                          fontSize: Sizing.getProportionateScreenWidth(15.0),
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    InkWell(
                                      onTap: (){
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            "Change",
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: Sizing.getProportionateScreenWidth(13.0),
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),
                                          Icon(
                                              Icons.arrow_forward_ios,
                                              size: Sizing.getProportionateScreenWidth(12.5),
                                              color: kPrimaryColor,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: Sizing.getProportionateScreenHeight(10.0),
                                ),
                                Text(
                                  address.toStringList()[1],
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.75),
                                      fontSize: Sizing.getProportionateScreenWidth(13.0),
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                                SizedBox(
                                  height: Sizing.getProportionateScreenHeight(2.5),
                                ),
                                Text(
                                  address.toStringList()[2],
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.75),
                                      fontSize: Sizing.getProportionateScreenWidth(13.0),
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizing.getProportionateScreenWidth(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.local_shipping_outlined,
                              color: kPrimaryColor.shade900,
                              size: Sizing.getProportionateScreenHeight(25.0),
                            ),
                            SizedBox(
                              width: Sizing.getProportionateScreenWidth(15.0),
                            ),
                            Text(
                              "Delivery Method",
                              style: TextStyle(
                                  color: kPrimaryColor.shade900,
                                  fontSize: Sizing.getProportionateScreenWidth(18.5),
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Sizing.getProportionateScreenHeight(20),
                      ),
                      Container (
                        height: Sizing.getProportionateScreenHeight(100),
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: courierServices.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: EdgeInsets.only(
                                    right: Sizing.getProportionateScreenWidth(10.0)
                                ),
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      selectedCourierService = index;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Sizing.getProportionateScreenWidth(12.0),
                                        vertical: Sizing.getProportionateScreenHeight(6.0)
                                    ),
                                    width: Sizing.screenWidth * 0.28,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                        border: Border.all(
                                            color: selectedCourierService == index ? kTextColor : Colors.grey.withOpacity(0.25)
                                        )
                                    ),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Image.asset(
                                                  courierServices[index].logo
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "\$ " + courierServices[index].deliveryCharge.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: Sizing.getProportionateScreenWidth(14),
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            courierServices[index].deliveryTime,
                                            style: TextStyle(
                                                color: Colors.grey.withOpacity(0.5),
                                                fontSize: Sizing.getProportionateScreenWidth(14),
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                          SizedBox(
                                            height: Sizing.getProportionateScreenHeight(5.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                      SizedBox(
                        height: Sizing.getProportionateScreenHeight(20),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizing.getProportionateScreenWidth(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.credit_card_rounded,
                              color: kPrimaryColor.shade900,
                              size: Sizing.getProportionateScreenHeight(25.0),
                            ),
                            SizedBox(
                              width: Sizing.getProportionateScreenWidth(15.0),
                            ),
                            Text(
                              "Payment Method",
                              style: TextStyle(
                                  color: kPrimaryColor.shade900,
                                  fontSize: Sizing.getProportionateScreenWidth(18.5),
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
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
                          elevation: 1.5,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Sizing.getProportionateScreenWidth(20),
                                vertical: Sizing.getProportionateScreenHeight(12.0)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  String.fromCharCode(0x2022) * 4 + " " +
                                  String.fromCharCode(0x2022) * 4 + " " +
                                  String.fromCharCode(0x2022) * 4 + " " +
                                  creditCardModel.cardNumber.substring(12),
                                  style: TextStyle(
                                      color: kPrimaryColor.shade900,
                                      fontSize: Sizing.getProportionateScreenWidth(15.0),
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                                Expanded(child: Container()),
                                InkWell(
                                  onTap: (){
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        "Change",
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: Sizing.getProportionateScreenWidth(13.0),
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: Sizing.getProportionateScreenWidth(12.5),
                                        color: kPrimaryColor,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
        height: Sizing.getProportionateScreenHeight(160.0),
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
                    "Items",
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.75),
                        fontSize: Sizing.getProportionateScreenWidth(12.5),
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: EdgeInsets.only(right: Sizing.getProportionateScreenWidth(13.0)),
                  child: Text(
                    "\$" + (cart.isEmpty ? "0" : totalCartValue().toStringAsFixed(2)),
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.75),
                        fontSize: Sizing.getProportionateScreenWidth(12.5),
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Sizing.getProportionateScreenHeight(6.5),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Sizing.getProportionateScreenWidth(13.0)),
                  child: Text(
                    "Delivery",
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.75),
                        fontSize: Sizing.getProportionateScreenWidth(12.5),
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: EdgeInsets.only(right: Sizing.getProportionateScreenWidth(13.0)),
                  child: Text(
                    "\$" + courierServices[selectedCourierService].deliveryCharge.toStringAsPrecision(2),
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.75),
                        fontSize: Sizing.getProportionateScreenWidth(12.5),
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Sizing.getProportionateScreenHeight(15.0),
            ),
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
                    "\$" + (cart.isEmpty ? "0" : (totalCartValue() + courierServices[selectedCourierService].deliveryCharge).toStringAsFixed(2)),
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
                showDialog(
                    context: context,
                    builder: (context){
                      return Center(
                        child: Container(
                          height: Sizing.screenHeight * 0.5,
                          width: Sizing.screenWidth * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(Sizing.getProportionateScreenWidth(20))
                            )
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: Sizing.screenHeight * 0.18,
                                margin: EdgeInsets.only(
                                  left: Sizing.getProportionateScreenWidth(20),
                                  right: Sizing.getProportionateScreenWidth(20),
                                  bottom: Sizing.getProportionateScreenHeight(20),
                                ),
                                decoration: BoxDecoration(
                                  gradient: kPrimaryGradientColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(Sizing.getProportionateScreenWidth(500)),
                                    bottomRight: Radius.circular(Sizing.getProportionateScreenWidth(500))
                                  )
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.white,
                                    size: Sizing.getProportionateScreenHeight(80),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: Sizing.getProportionateScreenWidth(13.0)),
                                child: Text(
                                  "Success",
                                  style: TextStyle(
                                      fontFamily: "arial",
                                      color: kPrimaryColor.shade900,
                                      fontSize: Sizing.getProportionateScreenWidth(25),
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.none
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Sizing.getProportionateScreenHeight(20.0),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: Sizing.getProportionateScreenWidth(13.0)),
                                child: Text(
                                  "Your order will be delivered soon.\nIt can be tracked under \"Orders\" section.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "arial",
                                      color: Colors.grey.withOpacity(0.75),
                                      fontSize: Sizing.getProportionateScreenWidth(15.0),
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.none
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Sizing.getProportionateScreenHeight(25.0),
                              ),
                              MaterialButton(
                                minWidth: Sizing.screenWidth * 0.75,
                                height: Sizing.getProportionateScreenHeight(50),
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
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
                                    "Continue Shopping",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Sizing.getProportionateScreenWidth(18.0),
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Sizing.getProportionateScreenHeight(20.0),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: Sizing.getProportionateScreenWidth(13.0)),
                                child: Text(
                                  "Go to Orders",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "arial",
                                      color: Colors.grey.withOpacity(0.75),
                                      fontSize: Sizing.getProportionateScreenWidth(18.0),
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.none
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
                  "Pay",
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