import 'package:flutter/material.dart';
import 'package:project/common_widget.dart';
import 'package:project/home_screen.dart';
import 'package:project/api/log_api.dart';

class forgetPassword extends StatefulWidget {
  forgetPassword();

  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  void resetPassword() async{
    if (!_formKey.currentState!.validate()) return;

    bool success =await ApiService.forgetPassword(email: emailController.text);
  if (success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Reset link sent to your email"),
        backgroundColor: Colors.green,
      ),
    );
    Future.delayed(Duration(seconds: 1),
        (){ Navigator.pop(context);}
    );

  }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Forgot Password"))),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),

              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Enter your email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter email";
                  }
                  if (!RegExp(
                    r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                  ).hasMatch(value)) {
                    return "Enter valid email";
                  }
                  return null;
                },
              ),

              SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: button(
                  onpressed: () {
                    resetPassword();
                  },
                  child: Text(
                    'Send Request',
                    style: TextStyle(color: Color(0xffffffff), fontSize: 18),
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
