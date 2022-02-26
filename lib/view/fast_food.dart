import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FastFood extends StatefulWidget {
  const FastFood({Key? key}) : super(key: key);

  @override
  _FastFoodState createState() => _FastFoodState();
}

class _FastFoodState extends State<FastFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:
          SvgPicture.asset("assets/icons/back.svg"),
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
                TextSpan(text: "Fast ", style: TextStyle(color: Colors.black)),
                TextSpan(text: "Food ", style: TextStyle(color: Colors.cyan)),

              ],
            ),
          ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg"),
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

            Container(
              height: 200,
              width: 200,
              child: Card(
                child: ListTile(
                  title: Text(""),
                ),
                elevation: 10,
                shadowColor: Colors.grey,
                margin: EdgeInsets.all(0),
                shape:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 1)
                ),
              ),
            )



          ],
        ),









      ),
    );
  }
}
