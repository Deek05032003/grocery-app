import 'package:flutter/material.dart';
import 'package:project/common_widget.dart';
import 'package:project/home_screen.dart';
import 'bottum_Nevi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project/api/log_api.dart';

class log extends StatefulWidget {
  log();

  @override
  State<log> createState() => _logState();
}

class _logState extends State<log> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool passwordvisible = false;
  bool isEmpty = true;
  bool isLoading = false;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  // void login() async {
  //   if (!_formkey.currentState!.validate()) return;
  //
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   String? savedEmail = prefs.getString("email");
  //   String? savedPassword = prefs.getString("password");
  //
  //   if (emailcontroller.text == savedEmail &&
  //       passwordcontroller.text == savedPassword) {
  //
  //     Navigator.pushNamed(context, 'bottum_Nevi');
  //
  //   } else {
  //
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.red,
  //         content: Text("Enter valid email and password"),
  //       ),
  //     );
  //   }
  // }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    login();
    });
  }

  void login() async {
    if (!_formkey.currentState!.validate()) return;
    setState(() {
      isLoading = true;
    });
    String? token = await ApiService.loginUser(
      email: emailcontroller.text,
      password: passwordcontroller.text,
    );
    setState(() {
      isLoading = false;
    });
    if (token != null && token.isNotEmpty) {
      await TokenManager.saveToken(token);
      await TokenManager.getToken();
        Navigator.pushReplacementNamed(context, 'bottum_Nevi');
    }
    else
    {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("invalid email or password"),
            backgroundColor: Colors.red,
          ),
        );
      }
  }

  // void checkLoginStatus() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString("token");
  //   // if (!mounted) return;
  //   if (token != null) {
  //     Navigator.pushReplacementNamed(context, 'bottum_Nevi');
  //   }
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
            key: _formkey,
            child: Column(
              children: [
                Stack(
                  children: [
                    con(
                      wd: double.infinity,
                      ht: MediaQuery
                          .of(context)
                          .size
                          .height * 0.3,
                      widget: Image.asset('assets/back.png', fit: BoxFit.fill),
                    ),
                    commonpaddingall(top: 0.08,
                        child: Center(child: Image.asset('assets/logcar.png'))),
                    commonpaddingall(
                      left: 0.05,
                      top: 0.23,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 235,
                      child: Text(
                        'Enter your email and password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ],
                ),
                padding(
                  b: 0,
                  l: 20,
                  r: 0,
                  t: 50,
                  child: SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.9,
                    height: MediaQuery
                        .of(context)
                        .size
                        .width * 0.2,
                    child: TextFormField(
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
                              color: Colors.black26, width: 1),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black26, width: 1),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                            .hasMatch(value)) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                padding(
                  b: 0,
                  l: 20,
                  r: 0,
                  t: 50,
                  child: SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.9,
                    height: MediaQuery
                        .of(context)
                        .size
                        .width * 0.2,
                    child: TextFormField(
                      controller: passwordcontroller,
                      obscureText: !passwordvisible,
                      decoration: InputDecoration(
                        label: Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black26, width: 1),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black26, width: 1),
                        ),
                        suffixIcon: IconButton(onPressed: () {
                          setState(() {
                            passwordvisible = !passwordvisible;
                          });
                        }, icon: passwordvisible
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Password';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                padding(
                  b: 0,
                  l: 200,
                  r: 0,
                  t: 20,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'forgetPassword_screen');
                    },
                    child: Text(
                      'Forget Password ?',
                      style: TextStyle(color: Color(0xff53b175)),
                    ),
                  ),
                ),
                padding(
                  b: 0,
                  l: 15,
                  r: 0,
                  t: 20,
                  child: SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.8,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.07,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff53b175),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                      ),
                      onPressed: () {
                        login();
                      },
                      child: isLoading ? commonsizebox(
                        height: 0.03,
                        width: 0.07,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      ) : Text(
                        'Log In',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                padding(
                  b: 0,
                  l: 70,
                  r: 0,
                  t: 20,
                  child: Row(
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'sign_up');
                        },
                        child: Text(
                          '  SignUp',
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
