import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_food_dot_com/constants/routes.dart';
import 'package:flutter_food_dot_com/model/product.dart';
import 'package:flutter_food_dot_com/networks/http_helper.dart';
import 'package:flutter_svg/svg.dart';

class FastFood extends StatefulWidget {
  const FastFood({Key? key}) : super(key: key);

  @override
  _FastFoodState createState() => _FastFoodState();
}

class _FastFoodState extends State<FastFood> {
  int _currentIndex = 0;
  List<Product> plist = [];

  @override

  void initState() {
    productView();
       super.initState();
  }

  void productView() {
       fideByCategoryIdTwo().then((res) {
      Map<String, dynamic> map = jsonDecode(res.body);
      var data = map['data'] as List<dynamic>;
      plist = data.map((e) => Product.fromMap(e)).toList();

      setState(() {

      });
    });
  }

  void search(String value){
    searchProduct(value).then((res) {
      Map<String, dynamic> map = jsonDecode(res.body);
      var data = map['data'] as List<dynamic>;
      plist = data.map((e) => Product.fromMap(e)).toList();

      setState(() {

      });
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {
            Navigator.pushNamed(context, Routes.homepage);
          },
        ),
        title: RichText(
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: "Fast ", style: TextStyle(color: Colors.black)),
              TextSpan(text: "Food ", style: TextStyle(color: Colors.cyan)),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg"),
            onPressed: () {
              Navigator.pushNamed(context, Routes.showcart);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value)  {
                search(value);
                print(value);
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: "search here",
                    hintStyle: TextStyle(color: Colors.black26)),
              ),
            ),

            // Container(
            //   height: 200,
            //   width: 200,
            //   child: Card(
            //     child: ListTile(
            //       title: Text(""),
            //     ),
            //     elevation: 10,
            //     shadowColor: Colors.grey,
            //     margin: EdgeInsets.all(0),
            //     shape:  OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10),
            //         borderSide: BorderSide(color: Colors.white, width: 1)
            //     ),
            //   ),
            // )

            GridView.count(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(plist.length, (index) {
                  return GestureDetector(

                    child: Card(
                      // elevation: 10.0,
                      // shape: new RoundedRectangleBorder(
                      //   borderRadius: new BorderRadius.circular(20.0)
                      // ),


                      child: Column(
                        children: [

                          Image.network(plist[index].imagesUri.replaceAll('http://localhost:8081', host),
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,

                          ),
                          // GridTile(
                          //   child: GridTileBar(
                          //     backgroundColor: Colors.black12,
                          //
                          //     title: Text(plist[index].productName) ,
                          //     subtitle:Text(plist[index].price.toString())
                          //   ),
                          // ),
                          Text(plist[index].productName, style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                          Text(plist[index].price.toString()+'TK', style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.bold), ),

                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, Routes.prodetails,arguments: plist[index].id);
                    },
                  ); //robohash.org api provide you different images for any number you are giving
                }),
              ),

          ],
        ),
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
        onTap: (_currentPages){
          setState(() {
            _currentIndex =_currentPages;
          });
        },
      ) ,

      //finish bottom navigation bar


    );
  }
}
