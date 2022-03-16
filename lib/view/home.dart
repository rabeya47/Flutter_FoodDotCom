import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_dot_com/constants/routes.dart';
import 'package:flutter_food_dot_com/model/product.dart';
import 'package:flutter_food_dot_com/networks/http_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.cyan),
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   icon:
        //       SvgPicture.asset("assets/icons/menu.svg"),
        //    onPressed: () {},
        // ),
        title: RichText(
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: "Food ", style: TextStyle(color: Colors.black)),
              TextSpan(text: "Dot ", style: TextStyle(color: Colors.cyan)),
              TextSpan(text: "Com ", style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg",
                ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.showcart);
            },
          )
        ],
      ),
      drawer: Drawer(

        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Food',
                style: TextStyle(color: Colors.yellow, fontSize: 25),
              ),
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/cover.jpg'))),
            ),
            ListTile(
              leading: Icon(Icons.add_location_alt),
              title: Text('Location'),
              onTap: () => {Navigator.pushNamed(context, Routes.map)},
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Register'),
              onTap: () => {Navigator.pushNamed(context, Routes.register)},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Feedback'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => {Navigator.pushNamed(context, Routes.login)},
            ),
          ],
        ),
      )      ,
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



           GestureDetector(
             onTap: () {
               Navigator.pushNamed(context, Routes.fastfood);
             },
             child: Container(

               margin: EdgeInsets.only(bottom: 15),
               padding: EdgeInsets.all(25),
               decoration: BoxDecoration(
                 gradient: LinearGradient(
                   colors: [
                      Colors.blue.withOpacity(0.2),
                      Colors.purple.withOpacity(0.4)
                   ],
                 ),
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(10),
                 boxShadow: [
                   BoxShadow(
                     offset: Offset(0,4),
                     blurRadius: 20,
                     color: Color(0xFFB0CCE1).withOpacity(0.32),
                   ),
                 ],

               ),


               child: Container(
                 decoration: BoxDecoration(
                   image: DecorationImage(

                     image: AssetImage('assets/images/fastfood.jpg'),
                     fit: BoxFit.cover,
                     colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),

                   )
                 ),
                 child: Image(

                   image:  AssetImage('assets/images/fastfood.jpg'), fit: BoxFit.cover),
               ),



               ),
           ),




            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, Routes.groceries);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.2),
                      Colors.purple.withOpacity(0.4)
                    ],
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,4),
                      blurRadius: 20,
                      color: Color(0xFFB0CCE1).withOpacity(0.32),
                    ),
                  ],

                ),
                child: Image(
                    image:  AssetImage('assets/images/groceries.jpg'), fit: BoxFit.cover),


              ),
            ),


            // Container(
            //   margin: EdgeInsets.only(bottom: 15),
            //   padding: EdgeInsets.all(25),
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [
            //         Colors.blue.withOpacity(0.2),
            //         Colors.purple.withOpacity(0.6)
            //       ],
            //     ),
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(10),
            //     boxShadow: [
            //       BoxShadow(
            //         offset: Offset(0,4),
            //         blurRadius: 20,
            //         color: Color(0xFFB0CCE1).withOpacity(0.32),
            //       ),
            //     ],
            //
            //   ),
            //   child: Image(
            //       image:  AssetImage('assets/images/food_offer.jpg'), fit: BoxFit.cover),
            //
            //
            // ),

            Container(
              margin: EdgeInsets.only(bottom: 15),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.withOpacity(0.2),
                    Colors.purple.withOpacity(0.4)
                  ],
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,4),
                    blurRadius: 20,
                    color: Color(0xFFB0CCE1).withOpacity(0.32),
                  ),
                ],

              ),
              child: Image(

                  image:  AssetImage('assets/images/food_offer60.png'), fit: BoxFit.cover),









            )


          ],
        ),
      ),

    );
  }
}
