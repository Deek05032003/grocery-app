import 'package:flutter/material.dart';
import 'package:project/common_widget.dart';
class myprofile extends StatefulWidget{
  myprofile();

  @override
  State<myprofile> createState() => _myprofileState();
}

class _myprofileState extends State<myprofile> {
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
            Stack(
              children:[commonsizebox(
                height: 0.4,
                width: double.infinity,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Color(0xff53B175),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(21),bottomRight: Radius.circular(21)),
                  ),
                 child: Hero(tag: 'pic',
                   child:CircleAvatar(
                     backgroundColor: Colors.transparent,
                     child: ClipOval(
                       child: SizedBox(
                         width: 250,
                         height: 250,
                         child: Image.asset(
                           'assets/profile.png',
                           fit: BoxFit.cover,
                         ),
                       ),
                     ),
                   ),
                 ) ,
                ),
              ),
                commonpaddingall(top:0.32,left: 0.85,child: IconButton(
                    onPressed:() async{
                      final result= await Navigator.pushNamed(context, 'profile_edit');
                      if(result==true){
                        setState(() {});
                      }
                    },
                    icon: Icon(Icons.edit_outlined,size: 34,color: Colors.black,))),
              ]
            ),
           commonpaddingall(top:0.04,child: commonTextField(0)),
           commonTextField(1),
           commonTextField(2),
           commonTextField(3),
          ],
        ),
      ),
    ),
  );
  }
  Widget commonTextField(int index){
    bool isAddress= index==3;
    bool isReadOnlyField=userdetail[index]['isReadOnly'];
    return commonpadding(width: 0.04,height:isAddress?0.03: 0.01,
      child: TextField(
       enabled:!isReadOnlyField,
        keyboardType: isAddress ? TextInputType.multiline: userdetail[index]['keyboardType'] ,
        controller: userdetail[index]['controller'],
        minLines: isAddress ? 3 : 1,
        maxLines: isAddress ? 3 : 1,
        style: TextStyle(color: isReadOnlyField?Colors.black:Colors.black),
        decoration: InputDecoration(
          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: Colors.black)
          ),
          enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(color: Colors.black)
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(color: Colors.black)
          ),
          label: Text(userdetail[index]['txt']),
      ),
      ),
    );
  }
}
List<Map<String,dynamic>>userdetail=[
  {
    'txt':'UserName',
    'controller':TextEditingController(text:'Aradhya Sahu'),
    'keyboardType':TextInputType.text,
    'isReadOnly':true,
   'icon':Icon(Icons.person_off)
  },
  {
    'txt':'EmailAddress',
    'controller':TextEditingController(text:'ara01.@gmail.com'),
    'keyboardType':TextInputType.emailAddress,
    'isReadOnly':true,
    'icon':Icon(Icons.email)
  },
  {
    'txt':'MobileNumber',
    'controller':TextEditingController(text:'5849302743'),
    'keyboardType':TextInputType.phone,
    'isReadOnly':true,
    'icon':Icon(Icons.mobile_off_outlined)
  },
  {
    'txt':'Address',
    'controller':TextEditingController(text:'Street No.-11,'
        'near by Junvani,'
    'Bhilai,dist-durg'),
    'keyboardType':TextInputType.text,
    'isReadOnly':true,
    'icon':Icon(Icons.location_on_outlined)
  }
];