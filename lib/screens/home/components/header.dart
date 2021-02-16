import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/screens/home/components/icon.dart';
import 'package:ecom_app_flutter/screens/home/components/search.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: Sizing.getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            svgSrc: Icons.shopping_cart,
            press: () => {},
          ),
          IconBtnWithCounter(
            svgSrc: Icons.notifications,
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}