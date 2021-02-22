import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_app_flutter/common/bottomNavbar.dart';
import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:ecom_app_flutter/static/categories.dart';
import 'package:ecom_app_flutter/static/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecom_app_flutter/screens/products/productsScreen.dart';
import 'package:ecom_app_flutter/screens/catagories/categoriesScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            Expanded(
              child: ListView(
                children: [
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
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          ProductsScreen(title: "Fashion Sale",)
                                  )
                              );
                            },
                            child: Container(
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
                                    "See More",
                                    style: TextStyle(
                                        color: Color.fromRGBO(238, 213, 26, 1),
                                        fontSize: Sizing.getProportionateScreenWidth(15),
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                  ),
                  SizedBox(
                    height: Sizing.getProportionateScreenHeight(10),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Sizing.getProportionateScreenWidth(20),
                        vertical: Sizing.getProportionateScreenHeight(15)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Catalogue",
                              style: TextStyle(
                                  color: kPrimaryColor.shade900,
                                  fontSize: Sizing.getProportionateScreenWidth(20),
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            CategoriesScreen()
                                    )
                                );
                              },
                              child: Text(
                                "See All",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: Sizing.getProportionateScreenWidth(12),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Sizing.getProportionateScreenHeight(10),
                        ),
                        Container(
                          height: Sizing.getProportionateScreenHeight(100),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categoriesList.length,
                              itemBuilder: (context, index){
                                return InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                ProductsScreen(title: categoriesList.keys.toList()[index],)
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
                                    width: Sizing.screenWidth / 3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      image: DecorationImage(
                                        image: AssetImage(categoriesList[categoriesList.keys.toList()[index]]),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            kPrimaryColor.withOpacity(0.5),
                                            BlendMode.color
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        categoriesList.keys.toList()[index],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Sizing.getProportionateScreenWidth(12),
                                            fontWeight: FontWeight.w400
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                );
                              }
                          ),
                        ),
                        SizedBox(
                          height: Sizing.getProportionateScreenHeight(20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Featured",
                              style: TextStyle(
                                  color: kPrimaryColor.shade900,
                                  fontSize: Sizing.getProportionateScreenWidth(20),
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => ProductsScreen(title: "Featured",)
                                    )
                                );
                              },
                              child: Text(
                                "See All",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: Sizing.getProportionateScreenWidth(12),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Sizing.getProportionateScreenHeight(10),
                        ),
                        Container(
                          height: Sizing.getProportionateScreenHeight(260),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: demoProducts.length,
                              itemBuilder: (context, index){
                                return Container(
                                  width: Sizing.screenWidth / 2.4,
                                  child: Stack(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                              horizontal: Sizing.getProportionateScreenWidth(5),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Sizing.getProportionateScreenWidth(20),
                                                vertical: Sizing.getProportionateScreenHeight(15)
                                            ),
                                            width: Sizing.screenWidth / 2.4,
                                            height: Sizing.getProportionateScreenHeight(160),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7.0),
                                              image: DecorationImage(
                                                image: AssetImage(demoProducts[index].images[0]),
                                                fit: BoxFit.cover,
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
                                                Icons.thumb_up :
                                                Icons.thumb_up_alt_outlined,
                                                color: demoProducts[index].isFavourite ?
                                                kTextColor : kPrimaryColor,
                                                size: Sizing.getProportionateScreenWidth(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: 0),
    );
  }
}