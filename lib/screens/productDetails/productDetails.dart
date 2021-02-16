import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/screens/auth/product.dart';
import 'package:ecom_app_flutter/screens/productDetails/components/app_bar.dart';
import 'package:ecom_app_flutter/screens/productDetails/components/body.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final double rating;
  final Product product;

  DetailsScreen({this.rating, this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: rating),
      body: Padding(
        padding: EdgeInsets.only(top: Sizing.getProportionateScreenHeight(15)),
        child: Body(product: product),
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
}