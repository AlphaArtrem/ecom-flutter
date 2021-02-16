import 'package:flutter/material.dart';

TextFormField buildPasswordFormField({String hint = "Enter your password"}) {
  return TextFormField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: "Password",
      hintText: hint,
      // If  you are using latest version of flutter then lable text and hint text shown like this
      // if you r using flutter less then 1.20.* then maybe this is not working properly
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: Icon(Icons.lock),
    ),
  );
}

TextFormField buildEmailFormField({String hint = "Enter your email"}) {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      labelText: "Email",
      hintText: hint,
      // If  you are using latest version of flutter then lable text and hint text shown like this
      // if you r using flutter less then 1.20.* then maybe this is not working properly
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: Icon(Icons.email),
    ),
  );
}