import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_food_dot_com/model/cart.dart';
import 'package:flutter_food_dot_com/networks/http_helper.dart';
import 'package:flutter_svg/svg.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  int _currentIndex = 0;

  List<Cart> cartList = [];
  @override

  void initState() {
    getAllCart().then((res) {
      Map<String, dynamic> map = jsonDecode(res.body);
      var data = map['data'] as List<dynamic>;
      cartList = data.map((e) => Cart.fromMap(e)).toList();
      // print(cartList);

      setState(() {

      });
    });
    super.initState();

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
              TextSpan(text: "cart", style: TextStyle(color: Colors.cyan)),

            ],
          ),
        ),

      ),

      body: Column(

        children: [
          ListView.builder(
            itemBuilder: (BuildContext, index){
              return Card(
                elevation: 2.0,
                child: ListTile(
                // leading: CircleAvatar(backgroundImage: AssetImage(plist[index].imageUri.replaceAll('http://localhost:8081', host)),),
                 leading: Image.network(cartList[index].imageUri.replaceAll('http://localhost:8081', host)),
                  title: Text(cartList[index].productName +' ' + cartList[index].quantity.toString()+'p'),
                  subtitle: Text(cartList[index].price.toString()+' TK'),

                  trailing:  IconButton(
                    //Icons.remove_circle,
                   // color: Colors.red,
                    icon: Icon(Icons.remove_circle,color: Colors.amber,),
                    onPressed: (){
                      deleteCartById(cartList[index].id);
                      print(cartList[index].id);
                    },

                  ),

                ),
              );
            },
             itemCount: cartList.length,
            shrinkWrap: true,
            padding: EdgeInsets.all(5),
            scrollDirection: Axis.vertical,
          ),
        ],
      ),







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
