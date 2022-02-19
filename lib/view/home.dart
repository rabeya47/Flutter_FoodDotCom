import 'package:flutter/material.dart';
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading:IconButton(
          icon:SvgPicture.asset("assets/icons/menu.svg",color: Colors.black45),
          onPressed: (){},
        ),
        title: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: "Food " ,style: TextStyle(color: Colors.black)),
              TextSpan(text: "Dot " ,style: TextStyle(color: Colors.cyan)),
              TextSpan(text: "Com " ,style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/bell.svg",color: Colors.black45),
              onPressed: (){},
              )
        ],

      ),

    );
  }
}
