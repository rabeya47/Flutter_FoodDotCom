import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_food_dot_com/constants/routes.dart';
import 'package:flutter_food_dot_com/model/cart.dart';
import 'package:flutter_food_dot_com/networks/http_helper.dart';
import 'package:flutter_svg/svg.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  List<Cart> cartList = [];
  void initState() {
    showValue();
    super.initState();

  }

  Future<void> showValue() async {

    await getAllCart().then((res) {
      Map<String, dynamic> map = jsonDecode(res.body);
      var data = map['data'] as List<dynamic>;
      cartList = data.map((e) => Cart.fromMap(e)).toList();
      // print(cartList);

      setState(() {

      });

    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            icon: SvgPicture.asset("assets/icons/back.svg"),
            onPressed: () {
              Navigator.pop(context, Routes.prodetails);
            },
          ),
          title: RichText(
            text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: "Order", style: TextStyle(color: Colors.cyan)),

              ],
            ),
          ),

          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset("assets/icons/food.svg",
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.homepage);
              },
            )
          ],
        ),

        body:SingleChildScrollView(
          child: Column(
            children: [



              GridView.count(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(cartList.length, (index) {
                  return GestureDetector(

                    child: Card(


                      child: Column(
                        children: [

                          Image.network(cartList[index].imageUri.replaceAll('http://localhost:8081', host),
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,

                          ),

                        ],
                      ),
                    ),
                    onTap: (){
                      //Navigator.pushNamed(context, Routes.prodetails,arguments: cartList[index].id);
                    },
                  ); //robohash.org api provide you different images for any number you are giving
                }),
              ),

            ],
          ),
        ),

    );
  }
}
