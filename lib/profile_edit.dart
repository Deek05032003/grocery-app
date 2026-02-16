import 'package:flutter/material.dart';
import 'common_widget.dart';
import 'package:flutter/cupertino.dart';
import 'profile_screen.dart';

class editprofile extends StatefulWidget {
  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffffffff),
        child: SingleChildScrollView(
          child: Column(
            children: [
              commonpadding(
                height: 0.05,
                width: 0,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.chevron_left, size: 35),
                    ),
                    commonpaddingall(
                      left: 0.28,
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 50,
                  child: IconButton.outlined(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.person_fill,
                      size: 80,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
              commonpaddingall(top: 0.03, child: commonTextField(0)),
              commonTextField(1),
              commonTextField(2),
              commonTextField(3),
              commonpaddingall(top: 0.03,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    commonsizebox(
                      width: 0.35,
                      height: 0.06,
                      child: button(
                        onpressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text('Cancel', style: TextStyle(fontSize: 20,color: Color(0xffffffff))),
                      ),
                    ),
                    commonsizebox(
                      width: 0.35,
                      height: 0.06,
                      child: button(
                        onpressed: () {
                          Navigator.pop(context, true);
                        },
                        child: Text('Save', style: TextStyle(fontSize: 20,color: Color(0xffffffff))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget commonTextField(int index) {
    bool isAddress = index == 3;
    return commonpadding(
      width: 0.04,
      height: isAddress ? 0.03 : 0.01,
      child: TextField(
        keyboardType: isAddress
            ? TextInputType.multiline
            : userdetail[index]['keyboardType'],
        controller: userdetail[index]['controller'],
        minLines: isAddress ? 3 : 1,
        maxLines: isAddress ? 3 : 1,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: Color(0xff53b175)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: Colors.black),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: Colors.black),
          ),
          label: Text(userdetail[index]['txt']),
        ),
      ),
    );
  }
}
