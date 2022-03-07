import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_food_dot_com/model/product.dart';
import 'package:flutter_food_dot_com/networks/http_helper.dart';
import 'package:flutter_svg/svg.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  // bool loaded = false;
  // Product product = Product(id: 0, productName: "", quantity: 0, price: 0, remarks: "", images: "", imagesUri: "", categoryId: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    // final args = ModalRoute.of(context)!.settings.arguments;
    // if(!loaded){
    //   productShowById(args.toString()).then((res) {
    //     loaded = true;
    //     Map<String, dynamic> map = jsonDecode(res.body);
    //
    //     print(map);
    //     setState(() {
    //       product =  Product.fromMap(map['data'] );
    //     });
    //
    //   });
    // }




    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {
            Navigator.pop(context, 'prodetails');
          },
        ),
        title: RichText(
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: "cart" , style: TextStyle(color: Colors.cyan)),

            ],
          ),
        ),

      ),

      body: Column(),







    //start bottom navigation bar

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          items:  [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.cyan,


            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
                backgroundColor: Colors.cyan

            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: Colors.cyan

            )
          ],
        onTap: (index){
            setState(() {
              _currentIndex =index;
            });
        },
      ) ,

      //finish bottom navigation bar






    );
  }
}
