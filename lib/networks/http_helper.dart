import 'dart:convert';

import 'package:flutter_food_dot_com/Model/user.dart';
import 'package:flutter_food_dot_com/model/cart.dart';
import 'package:flutter_food_dot_com/model/product.dart';
import 'package:http/http.dart' as http;

var host = 'http://192.168.1.22:8081';       //TSP
//var host = 'http://192.168.1.107:8081';    //home
//var host = 'http://localhost:8081';       // crome
//var host = 'http://192.168.1.73:8081';   //saiful vai


var signupApi = host+'/user/save';
var signinApi = host+'/user/login';
var getAllProductApi = host+'/product/getAll';
var fideByCategoryIdApi = host+ '/product/category/';
var getProductById = host+'/product/findById/';
var addToCart = host+'/addCart_withfile';
var cartGetAll = host + '/cart/getAll';
var deleteCart = host + '/cart/delete/';
var search = host + '/product/search?searchText=';



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





Future<http.Response> saveCart(Cart cart) async {


  final response = await http
      .post(Uri.parse(addToCart),headers: requestHeaders,body: jsonEncode(cart.toMap()));
  return  response;


}






Future<http.Response> getAllCart() async {
  final response = await http
      .get(Uri.parse(cartGetAll));
  return  response;

}


Future<http.Response> deleteCartById(int index) async {
  final response = await http
      .get(Uri.parse(deleteCart+index.toString()));
  return  response;

}





Future<http.Response> searchProduct(String value) async {
  final response = await http
      .get(Uri.parse(search+value));
  return  response;

}




