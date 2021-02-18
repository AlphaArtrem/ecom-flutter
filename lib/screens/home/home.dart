import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_app_flutter/common/bottomNavbar.dart';
import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
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
                            Icons.sort,
                            color: Colors.white,
                            size: Sizing.getProportionateScreenHeight(25),
                          ),
                          onPressed: (){}
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Quickie",
                              style: TextStyle(
                                  color: Color.fromRGBO(238, 213, 26, 1),
                                  fontSize: Sizing.getProportionateScreenWidth(20),
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              "Shop",
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
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: Sizing.getProportionateScreenHeight(20),
                          ),
                          onPressed: (){}
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
              height: Sizing.getProportionateScreenHeight(20),
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: Sizing.getProportionateScreenHeight(120),
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (a, car){},
                scrollDirection: Axis.horizontal,
              ),
              itemCount: 2,
              itemBuilder: (BuildContext context, int itemIndex, _) =>
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Sizing.getProportionateScreenWidth(20),
                        vertical: Sizing.getProportionateScreenHeight(15)
                    ),
                    width: Sizing.screenWidth * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(itemIndex % 2 == 0 ? "assets/fashion.jpg" :"assets/splash.jpg" ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            kPrimaryColor.withOpacity(0.5),
                            BlendMode.color
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fashion Sale",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizing.getProportionateScreenWidth(25),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: Sizing.getProportionateScreenHeight(5),
                        ),
                        Text(
                          "See More >",
                          style: TextStyle(
                              color: Color.fromRGBO(238, 213, 26, 1),
                              fontSize: Sizing.getProportionateScreenWidth(15),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  )
            ),

          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: 0),
    );
  }
}