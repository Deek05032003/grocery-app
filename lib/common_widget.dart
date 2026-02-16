import 'package:flutter/material.dart';

class con extends StatelessWidget {
  final Widget? widget;
  double? wd;
  double? ht;
  BoxDecoration? decoration;
  final String? text;
  final TextStyle? style;

  con({this.style, this.decoration, this.widget, this.wd, this.ht, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: wd,
      height: ht,
      child: widget,
      decoration: decoration,
    );
  }
}

class padding extends StatelessWidget {
  double l;
  double r;
  double t;
  double b;
  final Widget child;

  padding({
    required this.b,
    required this.l,
    required this.r,
    required this.t,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: l, right: r, top: t, bottom: b),
      child: child,
    );
  }
}

class button extends StatelessWidget {
  final style;
  final VoidCallback onpressed;
  final Widget child;
  final Color? color;

  button({
    this.style,
    required this.onpressed,
    required this.child,
    this.color = const Color(0xff53b175),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
      ),
      onPressed: onpressed,
      child: child,
    );
  }
}

class CommonTextfieldPages extends StatelessWidget {
  TextInputType Textinput;
  Widget? child;
  Widget? suffixicon;
  final int? maxlength;
  Color color;
  TextEditingController controller;
    VoidCallback onChanged;

  CommonTextfieldPages({
    this.child,
    required this.Textinput,
    this.maxlength,
    this.color = Colors.black38,
    this.suffixicon,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: Textinput,
      maxLength: maxlength,
     controller: controller,
    // onChanged: onChanged,
      decoration: InputDecoration(
        counterText: '',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color, width: 1),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: color),
        ),
        prefixIcon: child,
        prefixText: '+91',
        prefixStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        suffixIcon: suffixicon,
      ),
    );
  }
}

class com extends StatelessWidget {
  com();

  @override
  Widget build(BuildContext context) {
    return padding(
      b: 0,
      l: MediaQuery.of(context).size.width * 0.05,
      r: 0,
      t: MediaQuery.of(context).size.height * 0.03,
      child: con(
        wd: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12)),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> data_list = [
  {
    'img': 'assets/cokebeverage.png',
    'title': 'Diet Coke',
    'quantity': "355ml,Price",
    'price': "\$1.99",
    'plusimg': 'assets/plus.png',
  },
  {
    'img': 'assets/spritebeverage.png',
    'title': 'Sprite Can',
    'quantity': "325ml,Price",
    'price': "\$1.50",
    'plusimg': 'assets/plus.png',
  },
  {
    'img': 'assets/applejuicebeve.png',
    'title': 'Apple & Grape Juice',
    'quantity': "2lr,Price",
    'price': "\$15.99",
    'plusimg': 'assets/plus.png',
  },
  {
    'img': 'assets/orangejuicebeve.png',
    'title': 'Orange Juice',
    'quantity': "2lr,Price",
    'price': "\$15.99",
    'plusimg': 'assets/plus.png',
  },
  {
    'img': 'assets/cocacolabeve.png',
    'title': 'Coca Cola Can',
    'quantity': "325ml,Price",
    'price': "\$4.99",
    'plusimg': 'assets/plus.png',
  },
  {
    'img': 'assets/pepsibeve.png',
    'title': 'Pepsi Can',
    'quantity': "330ml,Price",
    'price': "\$4.99",
    'plusimg': 'assets/plus.png',
  },
  {
    'img': 'assets/spritebeverage.png',
    'title': 'Sprite Can',
    'quantity': "325ml,Price",
    'price': "\$4.99",
    'plusimg': 'assets/plus.png',
  },
];

class communcontainer extends StatelessWidget {
  final index;

  communcontainer({required this.index});

  @override
  Widget build(BuildContext context) {
    return con(
      wd: MediaQuery.of(context).size.width * 0.42,
      ht: MediaQuery.of(context).size.height * 0.28,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.circular(21),
      ),
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          padding(
            t: 25,
            l: 30,
            r: 0,
            b: 0,
            child: Image.asset(data_list[index]['img']),
          ),
          padding(
            t: 15,
            l: 10,
            r: 0,
            b: 0,
            child: Text(
              data_list[index]['title'],
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          padding(
            b: 0,
            l: 10,
            r: 0,
            t: 3,
            child: Text(
              data_list[index]['quantity'],
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black45,
              ),
            ),
          ),
          padding(
            l: 10,
            t: 3,
            r: 0,
            b: 0,
            child: Row(
              children: [
                Text(
                  data_list[index]['price'],
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                padding(
                  b: 0,
                  l: 40,
                  r: 0,
                  t: 5,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(data_list[index]['plusimg']),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class underline extends StatelessWidget {
  double width;
  double height;
  final Widget? widget;
  final Color? color;

  underline({
    required this.width,
    required this.height,
    this.widget,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height * height,
      decoration: BoxDecoration(
        color: color,
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: widget,
    );
  }
}

class commonpadding extends StatelessWidget {
  double width;
  double height;
  final Widget? child;

  commonpadding({required this.width, required this.height, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * width,
        vertical: MediaQuery.of(context).size.height * height,
      ),
      child: child,
    );
  }
}

class commonpaddingall extends StatelessWidget {
  final double left, right, top, bottom;
  final Widget? child;

  commonpaddingall({
    super.key,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * left,
        right: MediaQuery.of(context).size.width * right,
        top: MediaQuery.of(context).size.height * top,
        bottom: MediaQuery.of(context).size.height * bottom,
      ),
      child: child,
    );
  }
}

class commonsizebox extends StatelessWidget {
  double width, height;
  final Widget child;

  commonsizebox({
    super.key,
    this.width = 0,
    this.height = 0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height * height,
      child: child,
    );
  }
}

List<Map<String, dynamic>> detail_data = [
  {
    'img': 'assets/bananahome.png',
    'name': 'Organice Bananas',
    'qty': '7pcs,Priceg',
    'price': '\$4.99',
    'addicn': ' assets/plus.png',
  },
  {
    'img': 'assets/bananahome.png',
    'name': 'Organice Bananas',
    'qty': '7pcs,Priceg',
    'price': '\$4.99',
    'addicn': ' assets/plus.png',
  },
  {
    'img': 'assets/bananahome.png',
    'name': 'Organice Bananas',
    'qty': '7pcs,Priceg',
    'price': '\$4.99',
    'addicn': ' assets/plus.png',
  },
  {
    'img': 'assets/bananahome.png',
    'name': 'Organice Bananas',
    'qty': '7pcs,Priceg',
    'price': '\$4.99',
    'addicn': ' assets/plus.png',
  },
];
