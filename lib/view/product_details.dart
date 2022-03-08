
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_food_dot_com/model/cart.dart';
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

bool buttonSelected = false;
int _itemCount = 1;
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
        elevation: 1,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {
            Navigator.pop(context, '');
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
        // Text(product.productName)
        // Padding(
        //     padding:const EdgeInsets.all(8.0),
        // ),

        Padding(
           padding:const EdgeInsets.only(right: 0.0, left: 0.0),
         // padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Container(
            margin: EdgeInsets.only(bottom: 15),
            padding: EdgeInsets.all(25),
            height: 300,
            width: 400,
            decoration: BoxDecoration(

              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(0),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,4),
                  blurRadius: 20,
                  color: Color(0xFFB0CCE1).withOpacity(0.32),
                ),
              ],

              image:  DecorationImage(
                image: NetworkImage(product.imagesUri.replaceAll('http://localhost:8081', host)),
                fit: BoxFit.cover,
              ),

              ),

            // child: Image(
            //   image:AssetImage(product.imagesUri.replaceAll('http://localhost:8081', host)),
            //   fit: BoxFit.cover,
            // ),



            ),
        ),

        Expanded(
          child: Container(
           
            //margin: EdgeInsets.only(top: 0.0),
            height: 345,
            decoration: BoxDecoration(

              color: Colors.white12, //box color
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,4),
                  blurRadius: 20,
                  color: Color(0xFFB0CCE1).withOpacity(0.32),
                ),
              ],


            ),
            child: Column(

             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 30.0, top: 15.0),
                 child: Row(
                   children: [
                     Text("Item: "+product.productName,
                       style: TextStyle(fontSize: 20, letterSpacing: 0.5,fontWeight: FontWeight.bold,color: Colors.deepPurple),
                     ),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 30.0,top: 5.0),
                 child: Row(
                   children: [
                     Column(
                       children: [
                         Text("Price: "+product.price.toString()+"TK",
                           style: TextStyle(fontSize: 20, letterSpacing: 0.5,fontWeight: FontWeight.bold,color: Colors.deepPurple),
                         ),

                       ],
                   ),
                     Column(
                       children: [
                         IconButton(
                                 icon: SvgPicture.asset("assets/icons/like.svg",color:buttonSelected == true? Colors.red : Colors.cyan,),
                                  onPressed: () {

                                    setState(() {
                                          buttonSelected = true;
                                    });
                              },
                         )
                       ],

                     ),

                     Container(
                       padding: EdgeInsets.all(3),
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                           color: Colors.amber),
                       child: Row(
                         children: <Widget>[
                           _itemCount!=0? new  IconButton(icon: new Icon(Icons.remove),onPressed: ()=>setState(()=>_itemCount--),):new Container(),
                           new Text(_itemCount.toString()),
                           new IconButton(icon: new Icon(Icons.add),onPressed: ()=>setState(()=>_itemCount++))
                         ],

                       ),
                     )
                   ],



                 ),

               ),




               Column(



                 children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.only(left: 30.0, top: 20.0),
                     child: const Text('This  product is leading and most populer snack prepared with combination of good matireals. About us. For us, its not just about bringing you good food from your favourite restaurants. Its about making a connection, which is why we sit down ' , style: TextStyle(fontSize: 18),),
                   ),



                 ],
               ),

               Padding( padding: EdgeInsets.all(8),), //Space

               ElevatedButton(

                 style: ElevatedButton.styleFrom(
                   primary: Colors.amber, // background
                   onPrimary: Colors.deepPurple, // foreground
                 ),
                 onPressed: () {
                  // Navigator.pushNamed(context, 'showcart',arguments: product.id);
                   //Navigator.pushNamed(context, 'showcart');

                  String imageUri = product.imagesUri.toString();
                  String productName = product.productName;
                  double price = product.price * _itemCount;
                  print(_itemCount);
                  int quantity =  _itemCount;


                  Cart cart =new Cart(

                      productName : productName,
                      imageUri: imageUri,
                      quantity: quantity,
                      price: price,
                      id: 0,

                  );

                  print(cart);

                   saveCart(cart).then((res) {


                     Map<String,dynamic> map = jsonDecode(res.body);
                     print(map['statusCode']);

                     if(map['statusCode'] == 200){
                       SnackBar snackBar = SnackBar(
                         content: Text('Add to cart Successfull'),
                       );
                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                       Navigator.pushNamed(context, 'showcart');

                     }else{
                       SnackBar snackBar = SnackBar(
                         content: Text('Add to cartfailed'),

                       );
                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                     }


                   });

                 },
                 child: Text('Add To Card',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
               )

             ],
            ),

          ),
        )
        
      ],

      ),

    );
  }
}
