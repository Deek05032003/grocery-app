import 'package:flutter/material.dart';
import 'common_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api/log_api.dart';

class signup extends StatefulWidget {
  signup();

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final TextEditingController usernamecontroller=TextEditingController();
  final TextEditingController emailcontroller=TextEditingController();
  final TextEditingController passwordcontroller=TextEditingController();
  bool passwordvisible = false;
  bool isLoader=false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void stat() async {
    if (!formkey.currentState!.validate()) {return;}
    setState(() {
      isLoader=true;
    });
    bool success = await ApiService.registerUser(
      name: usernamecontroller.text,
      email: emailcontroller.text,
      password: passwordcontroller.text,
    );
   setState(() {
     isLoader=false;
   });
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Registration Successful"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacementNamed(context, 'log in');
      print("Username: ${usernamecontroller.text}");
      print("Email: ${emailcontroller.text}");
      print("Password: ${passwordcontroller.text}");

    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Registration Failed"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // void stat ()async {
  //   if (!formkey.currentState!.validate()) {
  //     return;
  //   }
  //   SharedPreferences pref= await SharedPreferences.getInstance();
  //   await pref.setString('email', emailcontroller.text);
  //   await pref.setString('password', passwordcontroller.text);
  //
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text("Registration Successful"),backgroundColor: Colors.green,),
  //   );
  //   setState(() {});
  //   Navigator.pushNamed(context, 'log in');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: con(
        wd: double.infinity,
        ht: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        widget: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Stack(
                  children: [
                    con(
                      wd: double.infinity,
                      ht: MediaQuery.of(context).size.height * 0.3,
                      widget: Image.asset('assets/back.png', fit: BoxFit.fill),
                    ),
                    commonpaddingall(
                      top: 0.08,
                      child: Center(child: Image.asset('assets/logcar.png')),
                    ),

                    commonpaddingall(
                      left: 0.05,
                      top: 0.23,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                        ),
                      ),
                    ),
                    commonpaddingall(
                      left: 0.05,
                      top: 0.28,
                      child: Text(
                        'Enter your credentials to continue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ],
                ),
                commonpadding(
                  width: 0.06,
                  height:0.032,
                  child: TextFormField(
                    controller: usernamecontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text(
                        'Username',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Username';
                      }
                    },
                  ),
                ),
          commonpadding(
            width: 0.06,
            height:0.032,
            child:TextFormField(
              controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: 1,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: 1,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(
                          r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                        ).hasMatch(value)) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                    ),
                  ),
          commonpadding(
            width: 0.06,
            height:0.032,
            child:TextFormField(
              controller: passwordcontroller,
                      obscureText: !passwordvisible,
                      decoration: InputDecoration(
                        label: Text(
                          'Password',
                          style:TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: 1,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: 1,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordvisible = !passwordvisible;
                            });
                          },
                          icon: passwordvisible
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }

                        if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
                          return 'Password must contain at least one letter';
                        }

                        if (!RegExp(r'[0-9]').hasMatch(value)) {
                          return 'Password must contain at least one number';
                        }

                        // if (!RegExp(
                        //   r'[!@#$%^&*(),.?":{}|<>]',
                        // ).hasMatch(value)) {
                        //   return 'Password must contain at least one special character';
                        // }
                        return null;
                      },
                    ),
                  ),
                commonpaddingall(
                  left:0.05,
                  child: Row(
                    children: [
                      Text(
                        'By continuing you agree to our',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff7c7c7c),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Terms of services',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff53b175),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                commonpaddingall(
                 left:0.05,
                  child: Row(
                    children: [
                      Text(
                        'and',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff7c7c7c),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff53b175),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                padding(
                  b: 0,
                  l: 15,
                  r: 0,
                  t: 20,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        stat();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff53b175),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                      ),
                      child: isLoader
                          ? SizedBox(
                        height:20,
                        width:20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      ) : Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                padding(
                  b: 0,
                  l: 85,
                  r: 0,
                  t: 10,
                  child: Row(
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'log in');
                        },
                        child: Text(
                          ' LogIn',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff53b175),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
