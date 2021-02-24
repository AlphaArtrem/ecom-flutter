import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_app_flutter/common/bottomNavbar.dart';
import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:ecom_app_flutter/screens/cart/cartScreen.dart';
import 'package:ecom_app_flutter/static/categories.dart';
import 'package:ecom_app_flutter/static/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecom_app_flutter/screens/products/productsScreen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
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
                              "Catalogue",
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
                          onPressed: (){
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => CartScreen()
                                )
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
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(
                  top: Sizing.getProportionateScreenHeight(8.0)
                ),
                itemCount: categoriesList.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            padding: EdgeInsets.only(
                                left: Sizing.getProportionateScreenWidth(20),
                                top: Sizing.getProportionateScreenHeight(20.0)
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0)
                              ),
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Container(
                                    height: Sizing.getProportionateScreenHeight(5),
                                    width: Sizing.getProportionateScreenWidth(100),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(25.0)
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Sizing.getProportionateScreenHeight(10),
                                ),
                                Center(
                                  child: Text(
                                    categoriesList.keys.toList()[index],
                                    style: TextStyle(
                                        color: kPrimaryColor.shade900,
                                        fontSize: Sizing.getProportionateScreenWidth(20),
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Sizing.getProportionateScreenHeight(10),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: subCategoriesList[categoriesList.keys.toList()[index]].length,
                                      itemBuilder: (context, curIndex){
                                        return InkWell(
                                          onTap: (){
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        ProductsScreen(title: subCategoriesList[categoriesList.keys.toList()[index]][curIndex],)
                                                )
                                            );
                                          },
                                          child:Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              subCategoriesList[categoriesList.keys.toList()[index]][curIndex],
                                              style: TextStyle(
                                                  color: Colors.grey.withOpacity(0.75),
                                                  fontSize: Sizing.getProportionateScreenWidth(13.5),
                                                  fontWeight: FontWeight.w500
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizing.getProportionateScreenWidth(20),
                        vertical: Sizing.getProportionateScreenHeight(8.0)
                      ),
                      child: Material(
                        color: Colors.white,
                        shadowColor: kPrimaryColor.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.5)
                        ),
                        elevation: 2.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: Sizing.getProportionateScreenWidth(20)
                              ),
                              child: Text(
                                categoriesList.keys.toList()[index],
                                style: TextStyle(
                                    color: kPrimaryColor.shade900,
                                    fontSize: Sizing.getProportionateScreenWidth(20),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              height: Sizing.getProportionateScreenHeight(100),
                              width: Sizing.getProportionateScreenWidth(100),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(7.5),
                                  topRight: Radius.circular(7.5),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(categoriesList[categoriesList.keys.toList()[index]],),
                                  fit: BoxFit.cover,
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: 1),
    );
  }
}