import 'package:flutter/material.dart';
import 'package:project/common_widget.dart';
import 'select_location.dart';
class veri extends StatelessWidget {
  const veri();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: con(
        wd: double.infinity,
        ht: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            con(
              wd: double.infinity,
              ht: MediaQuery.of(context).size.height * 0.3,
              widget: Stack(
                children: [
                  Image.asset('assets/back.png', fit: BoxFit.fill),
                  commonpaddingall(
                    left: 0.01,
                    top: 0.05,
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.chevron_left, size: 30),),
                  ),
                  commonpaddingall(
                    left: 0.04,
                    top: 0.15,
                    child: Text(
                      'Enter your 4-digit code',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  commonpaddingall(
                    left: 0.04,
                    top: 0.220,
                    child: Text(
                      'Code',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black38,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            commonpadding(
              width: 0.04,
              height: 0.01,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.12,
                child: TextField(keyboardType: TextInputType.number,
                  maxLength: 4,
                  decoration: InputDecoration(counterText: '',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26, width: 1),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26, width: 1),
                    ),
                    hintText: "- - - -",
                    hintStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),
                  ),
                ),
              ),
            ),
            commonpaddingall(top: 0.07,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                     TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend Code',
                        style: TextStyle(color: Color(0xff53b175),fontSize: 18,fontWeight: FontWeight.w400),
                      ),
                    ),
                         IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'select_location');
                      },
                      icon: Image.asset('assets/ic.png'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
