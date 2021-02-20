import 'package:ecom_app_flutter/common/bottomNavbar.dart';
import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'filterSelector.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues rangeValues = RangeValues(0,5000);
  String category = "Select Category", brand = "Select Brand";
  List<Color> colors = [Colors.black, Colors.red, Colors.green, Colors.blue, Colors.deepPurpleAccent, Colors.yellow, Colors.cyan];
  Color selectedColor = Colors.black;
  List<String> sizes = ["XXS", "XS", "S", "M", "L", "XL", "XXL"];
  List<String> selectedSizes = ["XXS", "XS", "S", "M", "L", "XL", "XXL"];
  String sortBy = "Featured";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Sizing.getProportionateScreenWidth(10),
                  right: Sizing.getProportionateScreenWidth(10),
                  top: Sizing.getProportionateScreenHeight(35)
              ),
              width: Sizing.screenWidth,
              height: Sizing.screenHeight * 0.12,
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
                          "Filter",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizing.getProportionateScreenWidth(20),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                      child: Text(
                        "Clear",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizing.getProportionateScreenWidth(15),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: (){
                        rangeValues = RangeValues(0,5000);
                        category = "Select Category";
                        brand = "Select Brand";
                        selectedColor = Colors.black;
                        selectedSizes = ["XXS", "XS", "S", "M", "L", "XL", "XXL"];
                        sortBy = "Featured";
                        setState(() {});
                      }
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Sizing.getProportionateScreenHeight(25.0),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizing.getProportionateScreenHeight(20.0)
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: Sizing.getProportionateScreenWidth(15.0),
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    RangeSlider(
                        values: rangeValues,
                        onChanged: (values){
                          setState(() {
                            rangeValues = values;
                          });
                        },
                        min: 0,
                        max: 10000,
                        activeColor: kTextColor,
                        inactiveColor: Colors.grey.withOpacity(0.25),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.25),
                            width: Sizing.getProportionateScreenWidth(0.75)
                        )
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(Sizing.getProportionateScreenHeight(12.5)),
                              decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                        color: Colors.grey.withOpacity(0.25),
                                        width: Sizing.getProportionateScreenWidth(0.75)
                                    )
                                  )
                              ),
                              child: Center(
                                child: Text(
                                  "\$" + rangeValues.start.toInt().toString(),
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: Sizing.getProportionateScreenWidth(16),
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "\$" + rangeValues.end.toInt().toString(),
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: Sizing.getProportionateScreenWidth(16),
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Sizing.getProportionateScreenHeight(25.0),
                    ),
                    Text(
                      "Categories",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: Sizing.getProportionateScreenWidth(15.0),
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(
                      height: Sizing.getProportionateScreenHeight(15.0),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => FilterSelector(
                              title: "Select Category",
                              options: [
                                "Category - 1",
                                "Category - 2",
                                "Category - 3",
                                "Category - 4",
                                "Category - 5",
                                "Category - 6",
                                "Category - 7",
                                "Category - 8",
                              ],
                              onChange: (value){
                                setState(() {
                                  category = value;
                                });
                              },
                            )
                          )
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.25),
                                width: Sizing.getProportionateScreenWidth(0.75)
                            )
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(Sizing.getProportionateScreenHeight(12.5)),
                                child: Text(
                                  category,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: Sizing.getProportionateScreenWidth(16),
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(Sizing.getProportionateScreenHeight(12.5)),
                              child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: Sizing.getProportionateScreenWidth(20.0),
                                  color: Colors.grey.withOpacity(0.5),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Sizing.getProportionateScreenHeight(25.0),
                    ),
                    Text(
                      "Brand",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: Sizing.getProportionateScreenWidth(15.0),
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(
                      height: Sizing.getProportionateScreenHeight(15.0),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => FilterSelector(
                                  title: "Select Brand",
                                  options: [
                                    "Brand - 1",
                                    "Brand - 2",
                                    "Brand - 3",
                                    "Brand - 4",
                                    "Brand - 5",
                                    "Brand - 6",
                                    "Brand - 7",
                                    "Brand - 8",
                                  ],
                                  onChange: (value){
                                    setState(() {
                                      brand = value;
                                    });
                                  },
                                )
                            )
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.25),
                                width: Sizing.getProportionateScreenWidth(0.75)
                            )
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(Sizing.getProportionateScreenHeight(12.5)),
                                child: Text(
                                  brand,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: Sizing.getProportionateScreenWidth(16),
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(Sizing.getProportionateScreenHeight(12.5)),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: Sizing.getProportionateScreenWidth(20.0),
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Sizing.getProportionateScreenHeight(25.0),
                    ),
                    Text(
                      "Colors",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: Sizing.getProportionateScreenWidth(15.0),
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(
                      height: Sizing.getProportionateScreenHeight(15.0),
                    ),
                    Container(
                      height: Sizing.getProportionateScreenHeight(60),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: colors.length,
                        itemBuilder: (context, index){
                          return Container(
                            margin: EdgeInsets.only(
                                right: Sizing.getProportionateScreenWidth(15.0)
                            ),
                            padding: EdgeInsets.all(Sizing.getProportionateScreenWidth(5.0)),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: selectedColor == colors[index] ? kTextColor : Colors.transparent
                              ),
                              shape: BoxShape.circle
                            ),
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  selectedColor = colors[index];
                                });
                              },
                              child: Center(
                                child: Container(
                                  height: Sizing.getProportionateScreenHeight(60),
                                  width: Sizing.getProportionateScreenWidth(40),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colors[index]
                                  ),
                                  child: Container(),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: Sizing.getProportionateScreenHeight(25.0),
                    ),
                    Text(
                      "Sizes",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: Sizing.getProportionateScreenWidth(15.0),
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(
                      height: Sizing.getProportionateScreenHeight(15.0),
                    ),
                    Container(
                      height: Sizing.getProportionateScreenHeight(40),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: sizes.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: Sizing.getProportionateScreenWidth(10.0)
                              ),
                              child: InkWell(
                                onTap: (){
                                  if(selectedSizes.contains(sizes[index])){
                                    selectedSizes.remove(sizes[index]);
                                  }else{
                                    selectedSizes.add(sizes[index]);
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Sizing.getProportionateScreenWidth(12.0),
                                      vertical: Sizing.getProportionateScreenHeight(6.0)
                                  ),
                                  width: Sizing.getProportionateScreenWidth(55),
                                  decoration: BoxDecoration(
                                      color: selectedSizes.contains(sizes[index]) ? kTextColor : Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(12.0))
                                  ),
                                  child: Center(
                                    child: Text(
                                      sizes[index],
                                      style: TextStyle(
                                          color: selectedSizes.contains(sizes[index]) ? Colors.white : kPrimaryColor.shade600,
                                          fontSize: Sizing.getProportionateScreenWidth(14),
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
                      height: Sizing.getProportionateScreenHeight(25.0),
                    ),
                    Text(
                      "Sort By",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: Sizing.getProportionateScreenWidth(15.0),
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(
                      height: Sizing.getProportionateScreenHeight(15.0),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => FilterSelector(
                                  title: "Sort By",
                                  options: ["Featured", "Rating", "Low To High", "High To Low"],
                                  onChange: (value){
                                    setState(() {
                                      sortBy = value;
                                    });
                                  },
                                )
                            )
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.25),
                                width: Sizing.getProportionateScreenWidth(0.75)
                            )
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(Sizing.getProportionateScreenHeight(12.5)),
                                child: Text(
                                  sortBy,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: Sizing.getProportionateScreenWidth(16),
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(Sizing.getProportionateScreenHeight(12.5)),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: Sizing.getProportionateScreenWidth(20.0),
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Sizing.getProportionateScreenHeight(15.0),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: MaterialButton(
                minWidth: Sizing.screenWidth * 0.9,
                height: Sizing.getProportionateScreenHeight(50),
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
                color: Color.fromRGBO(238, 213, 26, 1),
                textColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizing.getProportionateScreenWidth(40),
                    vertical: Sizing.getProportionateScreenHeight(10),
                  ),
                  child: Text(
                    "Result (20)",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizing.getProportionateScreenWidth(15),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Sizing.getProportionateScreenHeight(15.0),
            ),
          ],
        ),
      ),
    );
  }
}