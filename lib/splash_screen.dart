import 'dart:async';

import 'package:flutter/material.dart';
import 'onboarding.dart';
import 'package:project/api/log_api.dart';
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
    reloadPage();
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
void reloadPage()async{
  String? token = await TokenManager.getToken();
  if (token != null && token.isNotEmpty) {
    Navigator.pushReplacementNamed(context, 'bottum_Nevi');
  } else {
    Navigator.pushReplacementNamed(context, 'login');
  }
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


