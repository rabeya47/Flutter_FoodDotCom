

import 'package:flutter/material.dart';
import 'package:flutter_food_dot_com/constants/routes.dart';
import 'package:flutter_food_dot_com/view/login.dart';
import 'package:flutter_food_dot_com/view/product_details.dart';
import 'package:flutter_food_dot_com/view/register.dart';


import 'oder.dart';
import 'show_cart.dart';
import 'fast_food.dart';
import 'groceries.dart';
import 'home.dart';
import 'map.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    initialRoute: Routes.homepage,
    routes: {
      Routes.register: (context) => MyRegister(),
      Routes.login: (context) => MyLogin(),
      Routes.homepage: (context) => HomePage(),
      Routes.fastfood: (context) => FastFood(),
      Routes.groceries: (context) => Groceries(),
      Routes.prodetails: (context) => ProductDetiles(),
      Routes.showcart: (context) => AddCard(),
      Routes.map: (context) => Map(),
      Routes.oder: (context) => OrderPage(),
      // Routes.navigationBar: (context) => ButtomNavigationBar(),
    },
  ));
}

