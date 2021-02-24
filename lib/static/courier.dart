import 'package:flutter/cupertino.dart';

class Courier {
  double deliveryCharge;
  String logo;
  String deliveryTime;

  Courier({
    @required this.deliveryCharge,
    @required this.logo,
    @required this.deliveryTime,
  });
}

List<Courier> courierServices = [
  Courier(
      deliveryCharge: 10.5,
      logo: "assets/fedex.png",
      deliveryTime: "5-7 Days"
  ),
  Courier(
      deliveryCharge: 15.0,
      logo: "assets/dhl.png",
      deliveryTime: "3-4 Days"
  ),
  Courier(
      deliveryCharge: 20.8,
      logo: "assets/usps.png",
      deliveryTime: "1-2 Days"
  ),
];