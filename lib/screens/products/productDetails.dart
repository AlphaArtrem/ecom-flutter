import 'package:ecom_app_flutter/common/sizing.dart';
import 'package:ecom_app_flutter/common/styles.dart';
import 'package:ecom_app_flutter/static/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  Product product;
  ProductDetails({this.product});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentImage = 0;
  List<Color> colors = [Colors.black, Colors.red, Colors.green, Colors.blue, Colors.deepPurpleAccent, Colors.yellow, Colors.cyan];
  Color selectedColor = Colors.black;
  List<String> sizes = ["XXS", "XS", "S", "M", "L", "XL", "XXL"];
  String selectedSize = "M";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Colors.white,
            height: Sizing.getProportionateScreenHeight(400),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  onPageChanged: (index){
                    setState(() {
                      currentImage = index;
                    });
                  },
                  itemCount: widget.product.images.length,
                  itemBuilder: (context, index){
                    return Container(
                      height: Sizing.getProportionateScreenHeight(400),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.product.images[index]),
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  }
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(widget.product.images.length, (index){
                      return Container(
                        padding: EdgeInsets.only(right: Sizing.getProportionateScreenWidth(14.0)),
                        height: Sizing.getProportionateScreenHeight(10.5),
                        decoration: BoxDecoration(
                            color: currentImage == index ? kTextColor : kTextColor.withOpacity(0.5),
                            shape: BoxShape.circle
                        ),
                        child: Container(),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: Sizing.getProportionateScreenWidth(10)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: List.generate(7, (i){
                      if(i > 4){
                        if(i == 5){
                          return Expanded(
                            child: Text(
                              "   8 reviews",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: Sizing.getProportionateScreenWidth(13),
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          );
                        }else{
                          return Padding(
                            padding: EdgeInsets.only(
                                right: Sizing.getProportionateScreenWidth(16.0)
                            ),
                            child: Text(
                              "In Stock",
                              style: TextStyle(
                                  color: Colors.green.shade600,
                                  fontSize: Sizing.getProportionateScreenWidth(15),
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          );
                        }
                      }
                      if(i <= widget.product.rating){
                        return Icon(
                          Icons.star,
                          color: kTextColor,
                          size: Sizing.getProportionateScreenWidth(18),
                        );
                      }else{
                        return Icon(
                          Icons.star_border,
                          color: kTextColor,
                          size: Sizing.getProportionateScreenWidth(15),
                        );
                      }
                    }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.product.title,
                    style: TextStyle(
                        color: kPrimaryColor.shade900,
                        fontSize: Sizing.getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "\$" + widget.product.price.toString(),
                    style: TextStyle(
                        color: kPrimaryColor.shade900,
                        fontSize: Sizing.getProportionateScreenWidth(22.5),
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                SizedBox(
                  height: Sizing.getProportionateScreenHeight(5.0),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Colors",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: Sizing.getProportionateScreenWidth(15.0),
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: Sizing.getProportionateScreenWidth(5.0)
                  ),
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
                        height: Sizing.getProportionateScreenHeight(60),
                        width: Sizing.getProportionateScreenWidth(50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                width: Sizing.getProportionateScreenWidth(1.5),
                                color: selectedColor == colors[index] ? kTextColor : Colors.transparent
                            ),
                            shape: BoxShape.rectangle
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
                              width: Sizing.getProportionateScreenWidth(50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  shape: BoxShape.rectangle,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Sizes",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: Sizing.getProportionateScreenWidth(15.0),
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: Sizing.getProportionateScreenWidth(5.0)
                  ),
                  height: Sizing.getProportionateScreenHeight(50),
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
                              setState(() {
                                selectedSize = sizes[index];
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Sizing.getProportionateScreenWidth(12.0),
                                  vertical: Sizing.getProportionateScreenHeight(6.0)
                              ),
                              width: Sizing.getProportionateScreenWidth(55),
                              decoration: BoxDecoration(
                                  color: selectedSize == sizes[index] ? kTextColor : Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                  border: Border.all(
                                    color: selectedSize == sizes[index] ? kTextColor : Colors.grey.withOpacity(0.25)
                                  )
                              ),
                              child: Center(
                                child: Text(
                                  sizes[index],
                                  style: TextStyle(
                                      color: selectedSize == sizes[index] ? Colors.white : Colors.grey.withOpacity(0.5),
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
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizing.getProportionateScreenWidth(7.5),
          vertical: Sizing.getProportionateScreenHeight(10.0)
        ),
        height: Sizing.getProportionateScreenHeight(75.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.grey.withOpacity(0.75),
                  size: Sizing.getProportionateScreenHeight(25),
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                }
            ),
            MaterialButton(
              minWidth: Sizing.screenWidth * 0.6,
              height: Sizing.getProportionateScreenHeight(50),
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
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
                  "Add to Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizing.getProportionateScreenWidth(18.0),
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            IconButton(
                icon: Icon(widget.product.isFavourite ? Icons.favorite :
                Icons.favorite_border,),
                color: kPrimaryColor,
                onPressed: (){
                  setState(() {
                    widget.product.isFavourite = !widget.product.isFavourite;
                  });
                }
            )
          ],
        ),
      ),
    );
  }
}
