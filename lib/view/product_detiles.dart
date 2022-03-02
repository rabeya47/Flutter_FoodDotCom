
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_food_dot_com/model/product.dart';
import 'package:flutter_food_dot_com/networks/http_helper.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetiles extends StatefulWidget {
  const ProductDetiles({Key? key}) : super(key: key);

  @override
  _ProductDetilesState createState() => _ProductDetilesState();
}

class _ProductDetilesState extends State<ProductDetiles> {
bool loaded = false;
Product product = Product(id: 0, productName: "", quantity: 0, price: 0, remarks: "", images: "", imagesUri: "", categoryId: 0);
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    if(!loaded){
      productShowById(args.toString()).then((res) {
        loaded = true;
        Map<String, dynamic> map = jsonDecode(res.body);

        print(map);
        setState(() {
          product =  Product.fromMap(map['data'] );
        });

      });
    }


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {
            Navigator.pushNamed(context, 'homepage');
          },
        ),
        title: RichText(
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: "De", style: TextStyle(color: Colors.black)),
              TextSpan(text: "ta", style: TextStyle(color: Colors.cyan)),
              TextSpan(text: "ils", style: TextStyle(color: Colors.black)),

            ],
          ),
        ),

      ),
      body: Column(children: [
        Text(product.productName)

      ],

      ),

    );
  }
}
