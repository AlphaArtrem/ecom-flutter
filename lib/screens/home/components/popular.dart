import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:ecom_app_flutter/screens/auth/product.dart';
import 'package:ecom_app_flutter/screens/home/components/section.dart';
import 'package:ecom_app_flutter/screens/productDetails/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: Sizing.getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Based On Your Search", press: () {}),
        ),
        SizedBox(height: Sizing.getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                    (index) {
                  if (demoProducts[index].isPopular)
                    return ProductCard(product: demoProducts[index]);

                  return SizedBox.shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: Sizing.getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Sizing.getProportionateScreenWidth(20)),
      child: SizedBox(
        width: Sizing.getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsScreen(rating: product.rating, product: product,)))
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: product.id.toString(),
                    child: Image.asset(product.images[0], fit: BoxFit.contain,),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: Sizing.getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(Sizing.getProportionateScreenWidth(8)),
                      height: Sizing.getProportionateScreenWidth(28),
                      width: Sizing.getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: product.isFavourite
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: product.isFavourite
                          ? Icon(Icons.thumb_up, color: kPrimaryColor, size: Sizing.getProportionateScreenWidth(12),)
                          : Icon(Icons.thumb_up_alt_outlined, color: kPrimaryColor, size: Sizing.getProportionateScreenWidth(12),),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}