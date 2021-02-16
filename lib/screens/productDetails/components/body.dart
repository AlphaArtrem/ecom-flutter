import 'package:ecom_app_flutter/common/defaultButton.dart';
import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/screens/auth/product.dart';
import 'package:ecom_app_flutter/screens/productDetails/components/color_dots.dart';
import 'package:ecom_app_flutter/screens/productDetails/components/discription.dart';
import 'package:ecom_app_flutter/screens/productDetails/components/images.dart';
import 'package:ecom_app_flutter/screens/productDetails/components/top_container.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: Sizing.screenWidth * 0.15,
                          right: Sizing.screenWidth * 0.15,
                          bottom: Sizing.getProportionateScreenWidth(40),
                          top: Sizing.getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}