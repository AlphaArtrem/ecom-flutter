import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isPopular;
  bool isFavourite;

  Product({
    @required this.id,
    @required this.images,
    @required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.title,
    @required this.price,
    @required this.description,
  });
}


List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/iphone_1.jpg",
      "assets/iphone_2.jpg",
      "assets/iphone_3.jpg",
      "assets/iphone_4.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "iPhone 12 128 GB",
    price: 1200,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/hp_1.jpg",
      "assets/hp_2.jpg",
      "assets/hp_3.jpg",
      "assets/hp_4.jpg",
      "assets/hp_5.jpg",
      "assets/hp_6.jpg",

    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "HP Pavilion Gaming DK0271TX",
    price: 2000,
    description: description,
    rating: 4,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/headphones_1.jpg",
      "assets/headphones_2.jpg",
      "assets/headphones_3.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "H2011d Wired Gaming Headset",
    price: 50,
    description: description,
    rating: 4,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/xbox_1.jpg",
      "assets/xbox_2.jpg",
      "assets/xbox_3.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Xbox Wireless Controller – Robot White",
    price: 20.20,
    description: description,
    rating: 3,
    isFavourite: true,
  ),
];

const String description =
    "Product description will be placed here …";