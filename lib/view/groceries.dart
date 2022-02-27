import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_food_dot_com/model/product.dart';
import 'package:flutter_food_dot_com/networks/http_helper.dart';
import 'package:flutter_svg/svg.dart';

class Groceries extends StatefulWidget {
  const Groceries({Key? key}) : super(key: key);

  @override
  _GroceriesState createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {
  List<Product> plist = [];
  @override
  void initState() {
    fideByCategoryIdTwo().then((res) {
      Map<String, dynamic> map = jsonDecode(res.body);
      var data = map['data'] as List<dynamic>;
      plist = data.map((e) => Product.fromMap(e)).toList();
      setState(() {

      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:
          SvgPicture.asset("assets/icons/back.svg", color: Colors.black45),
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
              TextSpan(text: "Gro", style: TextStyle(color: Colors.black)),
              TextSpan(text: "ce", style: TextStyle(color: Colors.cyan)),
              TextSpan(text: "ries", style: TextStyle(color: Colors.black)),

            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg",
                color: Colors.black45),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (Value) {},
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: "search here",
                    hintStyle: TextStyle(color: Colors.black26)),
              ),

            ),

            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(plist.length, (index) {
                return Card(
                  child: Column(
                    children: [
                      Image.network(plist[index].imagesUri.replaceAll('http://localhost:8081', host)),
                      Text(plist[index].productName),
                      Text(plist[index].price.toString()),
                    ],
                  ),
                ); //robohash.org api provide you different images for any number you are giving
              }),
            ),

          ],
        ),
      ),
    );
  }
}
