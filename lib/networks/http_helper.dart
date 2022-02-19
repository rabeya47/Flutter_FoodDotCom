import 'dart:convert';

import 'package:flutter_food_dot_com/Model/user.dart';
import 'package:http/http.dart' as http;

var host = 'http://192.168.1.22:8081';
var signupApi = host+'/user/save';
var signinApi = host+'/user/login';


Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
};

Future<http.Response> signup(User user) async {

  final response = await http
      .post(Uri.parse(signupApi),headers: requestHeaders,body: jsonEncode(user.toMap()));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return  response;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception(response);
  }
}



Future<http.Response> signin(User user) async {


  final response = await http
      .post(Uri.parse(signinApi),headers: requestHeaders,body: jsonEncode(user.toMap()));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return  response;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


