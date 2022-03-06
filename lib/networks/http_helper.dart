import 'dart:convert';

import 'package:flutter_food_dot_com/Model/user.dart';
import 'package:flutter_food_dot_com/model/product.dart';
import 'package:http/http.dart' as http;

//var host = 'http://192.168.1.22:8081';       //TSP
var host = 'http://192.168.1.107:8081';    //home
//var host = 'http://localhost:8081';       // crome

var signupApi = host+'/user/save';
var signinApi = host+'/user/login';
var getAllProductApi = host+'/product/getAll';
var fideByCategoryIdApi = host+ '/product/category/';
var getProductById = host+'/product/findById/';




Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
};

Future<http.Response> signup(User user) async {

  final response = await http
      .post(Uri.parse(signupApi),headers: requestHeaders,body: jsonEncode(user.toMap()));
       return  response;

}



Future<http.Response> signin(User user) async {


  final response = await http
      .post(Uri.parse(signinApi),headers: requestHeaders,body: jsonEncode(user.toMap()));
       return  response;


}





Future<http.Response> getAllProduct() async {
  final response = await http
      .get(Uri.parse(getAllProductApi));
  return  response;

}





Future<http.Response> fideByCategoryIdTwo() async {
  final response = await http
      .get(Uri.parse(fideByCategoryIdApi+'2')); //fast food
  return  response;

}




Future<http.Response> fideByCategoryIdOne() async {
  final response = await http
      .get(Uri.parse(fideByCategoryIdApi+'1')); //groceries
  return  response;

}




Future<http.Response> productShowById(String id) async {
  final response = await http
      .get(Uri.parse(getProductById + id));
  return  response;

}