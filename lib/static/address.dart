import 'package:flutter/cupertino.dart';

class Address{
  String name;
  String street;
  String city;
  String state;
  int pinCode;
  String country;

  Address({
    @required this.name,
    @required this.street,
    @required this.city,
    @required this.state,
    @required this.pinCode,
    this.country = "USA"
  });

  List<String> toStringList() {
    return [
      name,
      street,
      "$city, $state $pinCode, $country"
    ];
  }
}

List<Address> addresses = [
  Address(
      name: "Cecilia Chapman",
      street: "711-2880 Nulla St.",
      city: "Mankato",
      state: "Mississippi",
      pinCode: 96522,
  ),
  Address(
    name: "Celeste Slater",
    street: "606-3727 Ullamcorper. Street",
    city: "Roseville ",
    state: "NH",
    pinCode: 11523,
  ),
  Address(
    name: "Iris Watson",
    street: "P.O. Box 283 8562 Fusce Rd.",
    city: "Mankato",
    state: "Nebraska",
    pinCode: 20620,
  ),
];