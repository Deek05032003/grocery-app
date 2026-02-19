import 'package:flutter/material.dart';
import 'package:project/common_widget.dart';
import 'number.dart';
class sign extends StatefulWidget {
   sign();

  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {
   final TextEditingController controller=TextEditingController();
   bool get isValid{
    return controller.text.length==10;
   }
void getnaviget(){
  if (isValid){
    Navigator.pushReplacementNamed(context, 'number');
  }
  else{
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.redAccent,
          content: Text('Please enter a valid 10-digit mobile number'),
          duration: Duration(seconds: 2),));
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: con(
        wd: double.infinity,
        ht: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        widget: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  con(
                    wd: double.infinity,
                    ht: MediaQuery.of(context).size.height * 0.4,
                    widget: Image.asset('assets/sign.png', fit: BoxFit.fill),
                  ),
                 commonpaddingall(
                    left: 0.67,
                    top: 0.02,
                    child: Image.asset('assets/t.png'),
                  ),
                ],
              ),
              commonpaddingall(
                left: 0.06,
                top: 0.03,
                child: Text(
                  'Get your groceries',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                ),
              ),
              commonpaddingall(
                left: 0.06,
                child: Text(
                  'with nector',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                ),
              ),
              commonpadding(
                width:  0.05,
                height: 0.04,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.12,
                  child: CommonTextfieldPages(
                    controller: controller,
                    onChanged: (){
                      setState(() {
                      });
                    },
                    Textinput: TextInputType.phone,
                    maxlength: 10,
                    child:  commonpaddingall(
                    right: 0.003,
                    bottom: 0.015,
                    child: Image.asset(
                      'assets/ind.png',
                      width: MediaQuery.of(context).size.width * 0.01,
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                  ),
                  suffixicon: IconButton(
                    onPressed:(){
                      getnaviget();
                    },
                    icon: Image.asset('assets/ic.png'),
                  ),),
                ),
              ),
              Center(
                child: Text(
                    'Or connect with social media',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black45,
                    ),
                  ),
              ),
             commonpaddingall(
                left: 0.08,
                top: 0.04,
                child:commonsizebox(
                  width:  0.8,
                  height: 0.07,
                  child: button(color: Color(0xff5383EC),
                    onpressed: () {
                    getnaviget();
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/google.png'),
                        commonpaddingall(
                          left: 0.05,
                          child: Text(
                            'Continue with Google',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
              ),
              commonpaddingall(
                left: 0.08,
                top: 0.04,
                child:commonsizebox(
                  width:  0.8,
                  height: 0.07,
                  child: button(color: Color(0xff4a66ac) ,
                    onpressed: () {
                     getnaviget();
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/faceb.png'),
                        commonpaddingall(
                          left: 0.07,
                          child: Text(
                            'Continue with Facebook',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
