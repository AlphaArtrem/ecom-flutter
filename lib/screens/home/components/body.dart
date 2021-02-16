import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/screens/home/components/categories.dart';
import 'package:ecom_app_flutter/screens/home/components/discount.dart';
import 'package:ecom_app_flutter/screens/home/components/header.dart';
import 'package:ecom_app_flutter/screens/home/components/offers.dart';
import 'package:ecom_app_flutter/screens/home/components/popular.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Sizing.getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: Sizing.getProportionateScreenWidth(10)),
            DiscountBanner(),
            Categories(),
            SpecialOffers(),
            SizedBox(height: Sizing.getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: Sizing.getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}