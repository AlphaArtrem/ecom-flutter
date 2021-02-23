import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_app_flutter/common/bottomNavbar.dart';
import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:ecom_app_flutter/screens/products/productDetails.dart';
import 'package:ecom_app_flutter/static/categories.dart';
import 'package:ecom_app_flutter/static/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'filterScreen.dart';

class ProductsScreen extends StatefulWidget {
  final String title;
  ProductsScreen({this.title});
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int selectedFilter = 0;
  int sortFilter = 0;
  String filter = "Featured";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Sizing.getProportionateScreenWidth(10)
                  ),
                  width: Sizing.screenWidth,
                  height: Sizing.screenHeight * 0.15,
                  decoration: BoxDecoration(
                      gradient: kPrimaryGradientColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: Sizing.getProportionateScreenHeight(25),
                          ),
                          onPressed: (){
                            Navigator.of(context).pop();
                          }
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizing.getProportionateScreenWidth(20),
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.white,
                            size: Sizing.getProportionateScreenHeight(20),
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (builder) => FilterScreen())
                            );
                          }
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: Sizing.screenHeight * 0.12,
                    left: Sizing.screenWidth * 0.05,
                    right: Sizing.screenWidth * 0.05,
                  ),
                  height: Sizing.getProportionateScreenHeight(50),
                  child: Material(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    elevation: 2.5,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: Sizing.getProportionateScreenWidth(12),
                              top: Sizing.getProportionateScreenHeight(4)
                          ),
                          child: Icon(
                            Icons.search_sharp,
                            color: Colors.grey,
                            size: Sizing.getProportionateScreenWidth(35),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: Sizing.getProportionateScreenWidth(12),
                                top: Sizing.getProportionateScreenHeight(2.5)
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "What are you looking for ?",
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  )
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Sizing.getProportionateScreenHeight(15.0),
            ),
            Container(
              height: Sizing.getProportionateScreenHeight(30),
              padding: EdgeInsets.only(
                  left: Sizing.getProportionateScreenWidth(30.0)
              ),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 11,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: EdgeInsets.only(
                          right: Sizing.getProportionateScreenWidth(10.0)
                      ),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            selectedFilter = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Sizing.getProportionateScreenWidth(12.0),
                            vertical: Sizing.getProportionateScreenHeight(3.0)
                          ),
                          decoration: BoxDecoration(
                            color: selectedFilter == index ? kTextColor : Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12.0))
                          ),
                          child: Center(
                            child: Text(
                              index == 0 ? "All" : "Filter ${index + 1}",
                              style: TextStyle(
                                  color: selectedFilter == index ? Colors.white : kPrimaryColor.shade600,
                                  fontSize: Sizing.getProportionateScreenWidth(12),
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),
            SizedBox(
              height: Sizing.getProportionateScreenHeight(15.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizing.getProportionateScreenWidth(30.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "20 Items",
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
                  itemCount: 20,
                  itemBuilder: (context, index){
                    index = Random().nextInt(demoProducts.length);
                    return Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => ProductDetails(
                                          product: demoProducts[index],
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
                                    image: AssetImage(demoProducts[index].images[0]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: List.generate(5, (i){
                                  if(i <= demoProducts[index].rating){
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
                                demoProducts[index].title,
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
                                "\$" + demoProducts[index].price.toString(),
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
                                  demoProducts[index].isFavourite = !demoProducts[index].isFavourite;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Icon(
                                  demoProducts[index].isFavourite ?
                                  Icons.favorite :
                                  Icons.favorite_border,
                                  color: demoProducts[index].isFavourite ?
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
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: 1),
    );
  }
}