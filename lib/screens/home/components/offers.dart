import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/screens/home/components/section.dart';
import 'package:flutter/material.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: Sizing.getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Recommendations",
            press: () {},
          ),
        ),
        SizedBox(height: Sizing.getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/phones.jpg",
                category: "Smartphone",
                numOfBrands: 10,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/laptops.jpg",
                category: "Laptops",
                numOfBrands: 24,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/fashion.jpg",
                category: "Fashion",
                numOfBrands: 24,
                press: () {},
              ),
              SizedBox(width: Sizing.getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Sizing.getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: Sizing.getProportionateScreenWidth(242),
          height: Sizing.getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Container(
                  width: Sizing.getProportionateScreenWidth(242),
                  height: Sizing.getProportionateScreenWidth(100),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizing.getProportionateScreenWidth(15.0),
                    vertical: Sizing.getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: Sizing.getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}