

import 'package:flutter/material.dart';
import 'package:flutter_food_dot_com/login.dart';
import 'package:flutter_food_dot_com/register.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
    },
  ));
}
