import 'package:ecom_app_flutter/common/styles.dart';
import 'package:ecom_app_flutter/screens/home/homeScreen.dart';
import 'package:ecom_app_flutter/screens/catagories/categoriesScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final int selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.home,
                      color: 0 == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                    onPressed: () => {
                      if(0 != selectedMenu){
                            Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => HomeScreen()
                            )
                        )
                      }
                    },
                  ),
                  Text(
                    "Home",
                    style: TextStyle(color: 0 == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,),
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.apps,
                      color: 1 == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                    onPressed: () => {
                      if(1 != selectedMenu){
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => CategoriesScreen()
                            )
                        )
                      }
                    },
                  ),
                  Text(
                    "Catalogue",
                    style: TextStyle(color: 1 == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,),
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.thumb_up,
                      color: 2 == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                    onPressed: () => {
                      if(2 != selectedMenu){
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => HomeScreen()
                            )
                        )
                      }
                    },
                  ),
                  Text(
                    "Liked",
                    style: TextStyle(color: 2 == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,),
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.account_circle,
                      color: 3 == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                    onPressed: () => {
                      if(3 != selectedMenu){
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => HomeScreen()
                            )
                        )
                      }
                    },
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(color: 3 == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,),
                  )
                ],
              ),
            ],
          )),
    );
  }
}