import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Groceries extends StatefulWidget {
  const Groceries({Key? key}) : super(key: key);

  @override
  _GroceriesState createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {
  @override
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

          ],
        ),
      ),
    );
  }
}
