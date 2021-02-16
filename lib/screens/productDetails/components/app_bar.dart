import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends PreferredSize {
  final double rating;

  CustomAppBar({@required this.rating});

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
        EdgeInsets.only(
            left: Sizing.getProportionateScreenWidth(20), 
            right: Sizing.getProportionateScreenWidth(20),
            top: Sizing.getProportionateScreenHeight(10)
        ),
        child: Row(
          children: [
            SizedBox(
              height: Sizing.getProportionateScreenWidth(40),
              width: Sizing.getProportionateScreenWidth(40),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                color: Colors.white,
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  size: 25,
                ),
              ),
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Text(
                    "$rating",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.yellow,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}