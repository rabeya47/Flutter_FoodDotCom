import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_food_dot_com/constants/routes.dart';
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
  double deliveryCharge = 60.0;



  List<Cart> cartList = [];
  @override

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
      calculate();
      setState(() {

      });

    });
  }



  double subTotal = 0.0;
  void calculate(){
    subTotal = 0.0;
    for (var index = 0; index < cartList.length; index++) {
      subTotal+= cartList[index].price;
    }
    print(subTotal);
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
              TextSpan(text: "cart", style: TextStyle(color: Colors.cyan)),

            ],
          ),
        ),

      ),

      body: Column(
        children: [
          Container(
            height: 420,
            color: Colors.brown.shade100,
            child:Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext, index){
                      return Card(
                        color: Colors.brown.shade50,
                        elevation: 2.0,
                        child: ListTile(
                        // leading: CircleAvatar(backgroundImage: AssetImage(plist[index].imageUri.replaceAll('http://localhost:8081', host)),),
                         leading: Image.network(cartList[index].imageUri.replaceAll('http://localhost:8081', host),height: 100,width: 90,),
                          title: Text(cartList[index].productName +' ' + cartList[index].quantity.toString()+'p',style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text(cartList[index].price.toString()+' TK',style: TextStyle(fontWeight: FontWeight.bold),),

                          trailing:  IconButton(
                            //Icons.remove_circle,
                           // color: Colors.red,
                            icon: Icon(Icons.remove_circle,color: Colors.amber.shade900,),
                            onPressed: () async {
                              await deleteCartById(cartList[index].id);
                               showValue();
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
                ),
              ],
            ),

          ),

          Container(

            height: 180,
            color: Colors.orange.shade50,
            child: Column(
             children: [
               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 18.0,top: 20),
                     child: Column(
                       children: [
                         Text("Sub Total",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),)
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 210.0,top: 12),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         Text(subTotal.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                       ],
                     ),
                   ),
                 ],

               ),
               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 18.0,top: 12),
                     child: Column(
                       children: [
                         Text("Delivery Charge",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 180.0,top: 12),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         Text(deliveryCharge.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                       ],
                     ),
                   ),
                 ],

               ),

               Divider(
                 color: Colors.black,
                 thickness: 1,
               ),
               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 18.0,top: 12),
                     child: Column(
                       children: [
                         Text("Total",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 240.0,top: 12),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         Text((subTotal+deliveryCharge).toString()+" TK",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                       ],
                     ),
                   ),
                 ],

               ),

             ],
            ),








          )


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
