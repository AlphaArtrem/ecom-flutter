import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:ecom_app_flutter/screens/cart/cart.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(Sizing.getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title.length > 25 ? cart.product.title.substring(0, cart.product.title.substring(0, 25).lastIndexOf(" ")) : cart.product.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 1,
              softWrap: false,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${cart.product.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: "  x${cart.numOfItem}",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black45)),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}