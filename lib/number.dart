import 'package:flutter/material.dart';
import 'package:project/common_widget.dart';

class num extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: con(
        wd: double.infinity,
        ht: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        widget: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              con(
                decoration: BoxDecoration(color: Colors.white),
                wd: double.infinity,
                ht: MediaQuery.of(context).size.height * 0.3,
                widget: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      padding(
                        l: 3,
                        t: 50,
                        b: 0,
                        r: 0,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.chevron_left, size: 30),
                        ),
                      ),
                      padding(
                        l: 30,
                        t: 50,
                        r: 0,
                        b: 0,
                        child: Text(
                          'Enter your mobile number',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      padding(
                        b: 0,
                        l: 30,
                        r: 0,
                        t: 20,
                        child: Text(
                          'Mobile Number',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              padding(
                l: 20,
                r: 0,
                b: 0,
                t: 5,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.12,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: InputDecoration(counterText: '',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38, width: 1),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black38),
                      ),
                      prefixIcon: padding(
                        t: 0,
                        l: 0,
                        r: 3,
                        b: 15,
                        child: Image.asset(
                          'assets/ind.png',
                          width: MediaQuery.of(context).size.width * 0.01,
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                      ),
                      prefixText: '+91',
                      prefixStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              padding(
                b: 0,
                l: 300,
                r: 0,
                t: 150,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'verification');
                  },
                  icon: Image.asset('assets/ic.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
