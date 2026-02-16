import 'dart:async';

import 'package:flutter/material.dart';
import 'onboarding.dart';
class splash extends StatefulWidget{
  const splash();

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  var op=0.0;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), (){
      setState(() {
        op=1;
      });
    }
    );
    Timer(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> welcome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       width: MediaQuery.of(context).size.width*1,
       height: MediaQuery.of(context).size.height*1,
         decoration: BoxDecoration(color: Color(0xff53b175),
         ),
        child: AnimatedOpacity(opacity: op,duration: Duration(seconds: 3),
            child: Center(child: Image.asset('assets/upimg.png',))),
     ),
   );

  }
}


