

import 'package:flutter/material.dart';
import 'package:flutter_food_dot_com/view/login.dart';
import 'package:flutter_food_dot_com/view/product_details.dart';
import 'package:flutter_food_dot_com/view/register.dart';

import 'show_cart.dart';
import 'fast_food.dart';
import 'groceries.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    initialRoute: "homepage",
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'homepage': (context) => HomePage(),
      'fastfood': (context) => FastFood(),
      'groceries': (context) => Groceries(),
      'prodetails': (context) => ProductDetiles(),
      'showcart': (context) => AddCard(),
    },
  ));
}
