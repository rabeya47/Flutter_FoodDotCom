
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
        elevation: 1,
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
        // Text(product.productName)
        // Padding(
        //     padding:const EdgeInsets.all(8.0),
        // ),

        Padding(
           padding:const EdgeInsets.only(right: 40.0, left: 40.0),
         // padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Container(
            margin: EdgeInsets.only(bottom: 15),
            padding: EdgeInsets.all(25),
            height: 300,
            width: 400,
            decoration: BoxDecoration(

              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(10),
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

              color: Colors.cyan[100],
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
               Row(
                 children: [
                   Padding(padding: const EdgeInsets.only(top: 80.0, left: 40.0),),
                   Text("Item: "+product.productName,
                     style: TextStyle(fontSize: 20, letterSpacing: 0.5,),
                   ),
                 ],
               ),

               Row(
                 children: [

                   Padding(padding:const EdgeInsets.only(left: 40.0),),
                   Text("Price: "+product.price.toString()+"TK",
                     style: TextStyle(fontSize: 20),
                   ),
                 ],
               ),


               Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   // Padding(padding:const EdgeInsets.only(left: 40.0),),
                   const Text('This  product is leading and most populer ' , style: TextStyle(fontSize: 18),),
                   const Text('snack prepared with combination of good matireals', style: TextStyle(fontSize: 18)),


                 ],
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
