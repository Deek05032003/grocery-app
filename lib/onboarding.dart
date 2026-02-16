import 'package:flutter/material.dart';
import 'package:project/common_widget.dart';
import 'package:project/sign_in.dart';

class welcome extends StatelessWidget {
  const welcome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/img2.png',
              fit: BoxFit.fill,
            ),
          ),
          commonpaddingall(top: 0.55,
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/car.png'),
                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 32, color: Colors.white,fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'to our store',
                    style: TextStyle(fontSize: 32, color: Colors.white,fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Get your grocaries in as fast as one hour ',
                      style: TextStyle(fontSize: 18, color: Colors.white54),
                    ),
                  ),
                  commonpaddingall(
                  top: 0.05,
                    child: commonsizebox(
                      width: 0.8,
                      height: 0.07,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context,'sign_in');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff53b175),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                        ),
                        child: Text(
                          'Get Started',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
