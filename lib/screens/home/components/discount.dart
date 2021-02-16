import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(Sizing.getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: Sizing.getProportionateScreenWidth(20),
        vertical: Sizing.getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: "Biggest Offer Of The Decade\n"),
            TextSpan(
              text: "Cashback 50%",
              style: TextStyle(
                fontSize: Sizing.getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}