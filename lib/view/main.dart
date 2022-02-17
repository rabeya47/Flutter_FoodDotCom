

import 'package:flutter/material.dart';
import 'package:flutter_food_dot_com/view/login.dart';
import 'package:flutter_food_dot_com/view/register.dart';

import 'home.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "login",
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'homepage': (context) => HomePage(),
    },
  ));
}
