import 'package:ecom_app_flutter/common/bottomNavbar.dart';
import 'package:ecom_app_flutter/screens/home/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: 0),
    );
  }
}