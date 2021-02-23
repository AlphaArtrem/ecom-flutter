import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_app_flutter/common/bottomNavbar.dart';
import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:ecom_app_flutter/screens/home/homeScreen.dart';
import 'package:ecom_app_flutter/screens/products/productDetails.dart';
import 'package:ecom_app_flutter/static/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  String filter = "Featured";
  List<Product> wishlistProducts = List<Product>.from(demoProducts);

  @override
  void initState() {
    wishlistProducts.forEach((element) {
      element.isFavourite = true;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Sizing.getProportionateScreenWidth(10),
                  top: Sizing.getProportionateScreenHeight(25.0)
              ),
              width: Sizing.screenWidth,
              height: Sizing.screenHeight * 0.125,
              decoration: BoxDecoration(
                  gradient: kPrimaryGradientColor
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: Sizing.getProportionateScreenHeight(25),
                      ),
                      onPressed: (){
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => HomeScreen()
                            )
                        );
                      }
                  ),
                  Expanded(child: Container(), flex: 2,),
                  Text(
                    "Wishlist",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizing.getProportionateScreenWidth(20),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Expanded(child: Container(), flex: 3,)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Sizing.getProportionateScreenWidth(30.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "4 Items",
                    style: TextStyle(
                        color: kPrimaryColor.shade900,
                        fontSize: Sizing.getProportionateScreenWidth(20),
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Sort By",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: Sizing.getProportionateScreenWidth(12),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: Sizing.getProportionateScreenWidth(10),),
                      DropdownButton<String>(
                        dropdownColor: Colors.white,
                        underline: Container(),
                        elevation: 1,
                        value: filter,
                        onChanged: (val) {
                          setState(() {
                            filter = val;
                          });
                        },
                        items: ["Featured", "Rating", "Low To High", "High To Low"].map((filter) {
                          return  DropdownMenuItem<String>(
                            value: filter,
                            child: Text(
                              filter,
                              style: TextStyle(
                                  color: kPrimaryColor.shade900,
                                  fontSize: Sizing.getProportionateScreenWidth(12.0),
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Sizing.getProportionateScreenHeight(15.0),
            ),
            Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: Sizing.getProportionateScreenWidth(25)),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: Sizing.getProportionateScreenWidth(10),
                      crossAxisSpacing: Sizing.getProportionateScreenWidth(8.0),
                      crossAxisCount: 2,
                      childAspectRatio: Sizing.screenHeight / (Sizing.screenWidth * 3.5),
                    ),
                    itemCount: wishlistProducts.length,
                    itemBuilder: (context, index){
                      return Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap:(){
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => ProductDetails(
                                            product: wishlistProducts[index],
                                          )
                                      )
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: Sizing.getProportionateScreenWidth(5),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Sizing.getProportionateScreenWidth(20),
                                      vertical: Sizing.getProportionateScreenHeight(15)
                                  ),
                                  height: Sizing.getProportionateScreenHeight(160),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    image: DecorationImage(
                                      image: AssetImage(wishlistProducts[index].images[0]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: List.generate(5, (i){
                                    if(i <= wishlistProducts[index].rating){
                                      return Icon(
                                        Icons.star,
                                        color: kTextColor,
                                        size: Sizing.getProportionateScreenWidth(12),
                                      );
                                    }else{
                                      return Icon(
                                        Icons.star_border,
                                        color: kTextColor,
                                        size: Sizing.getProportionateScreenWidth(12),
                                      );
                                    }
                                  }),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  wishlistProducts[index].title,
                                  style: TextStyle(
                                      color: kPrimaryColor.shade900,
                                      fontSize: Sizing.getProportionateScreenWidth(12),
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "\$" + wishlistProducts[index].price.toString(),
                                  style: TextStyle(
                                      color: kPrimaryColor.shade900,
                                      fontSize: Sizing.getProportionateScreenWidth(15),
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: Sizing.getProportionateScreenWidth(125),
                                top: Sizing.getProportionateScreenHeight(145)
                            ),
                            child: Material(
                              color: Colors.white,
                              elevation: 2.5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)
                              ),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    wishlistProducts.removeAt(index);
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Icon(
                                    wishlistProducts[index].isFavourite ?
                                    Icons.favorite :
                                    Icons.favorite_border,
                                    color: wishlistProducts[index].isFavourite ?
                                    kTextColor : kPrimaryColor,
                                    size: Sizing.getProportionateScreenWidth(15),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }
                )
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: 2),
    );
  }
}