import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": Icons.mobile_friendly, "text": "Mobiles"},
      {"icon": Icons.laptop, "text": "Laptops"},
      {"icon": Icons.gamepad, "text": "Games"},
      {"icon": Icons.directions_run, "text": "Fitness"},
      {"icon": Icons.read_more, "text": "More"},
    ];
    return Padding(
      padding: EdgeInsets.all(Sizing.getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
              (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: Sizing.getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(Sizing.getProportionateScreenWidth(15)),
              height: Sizing.getProportionateScreenWidth(55),
              width: Sizing.getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: kSecondaryColor.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: kPrimaryColor,),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}