import 'package:flutter/material.dart';

TextFormField buildPasswordFormField({String hint = "Enter your password"}) {
  return TextFormField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: "Password",
      hintText: hint,
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
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: Icon(Icons.email),
    ),
  );
}