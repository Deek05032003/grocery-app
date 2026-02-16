import 'package:flutter/material.dart';
import 'common_widget.dart';

List<Map<String, dynamic>> cartdata = [];

class my_cart extends StatefulWidget {
  my_cart();

  @override
  State<my_cart> createState() => _my_cartState();
}

class _my_cartState extends State<my_cart> {
  double TotalPrice(int index) {
    double price = cartdata[index]['price'];
    int unit = cartdata[index]['qty'];
    return price * unit;
  }

  void openbottomsheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return bottomsheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color(0xffffffff)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.028,
              ),
              child: Center(
                child: Text(
                  'My Cart',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            underline(width: double.infinity, height: 0),
            Expanded(
              child: cartdata.isEmpty
                  ? emptycart()
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: cartdata.length,
                      itemBuilder: (contex, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03,
                          ),
                          child: underline(
                            width: 0.8,
                            height: 0.17,
                            widget: common_row(index),
                          ),
                        );
                      },
                    ),
            ),
            padding(
              b: MediaQuery.of(context).size.width * 0.07,
              l: MediaQuery.of(context).size.width * 0.02,
              r: 0,
              t: MediaQuery.of(context).size.width * 0.01,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.87,
                height: MediaQuery.of(context).size.height * 0.07,
                child: button(
                  onpressed: () {
                    openbottomsheet();
                  },
                  child: Text(
                    'Go to Checkout',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Color(0xfffcfcfc),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emptycart() {
    return Center(
      child: Text('Your Cart is Empty', style: TextStyle(fontSize: 24,color: Color(0xff7c7c7c))),
    );
  }

  Widget common_row(int index) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.width * 0.25,
          child: Image.asset(cartdata[index]['img']),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartdata[index]['title'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  cartdata[index]['quantity'],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff7c7c7c),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: quantitybutton(
                      index: index,
                      onUpdate: () {
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  cartdata.removeAt(index);
                });
              },
              child: Icon(Icons.close, color: Color(0xff7c7c7c)),
            ),
            Text(
              '\$${TotalPrice(index).toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}

class quantitybutton extends StatefulWidget {
  final int index;
  final VoidCallback onUpdate;

  quantitybutton({required this.onUpdate, required this.index});

  @override
  State<quantitybutton> createState() => _quantitybuttonState();
}

class _quantitybuttonState extends State<quantitybutton> {
  @override
  Widget build(BuildContext context) {
    return con(
      wd: MediaQuery.of(context).size.width * 0.2,
      ht: MediaQuery.of(context).size.height * 0.05,
      widget: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (cartdata[widget.index]['qty'] > 1) {
                setState(() {
                  cartdata[widget.index]['qty']--;
                });
                widget.onUpdate();
              }
            },
            child: Icon(Icons.horizontal_rule, color: Colors.black54),
          ),
          padding(
            l: MediaQuery.of(context).size.width * 0.017,
            t: 0,
            r: 0,
            b: 0,
            child: con(
              wd: MediaQuery.of(context).size.width * 0.12,
              ht: MediaQuery.of(context).size.height * 0.056,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(17),
              ),
              widget: Center(
                child: Text(
                  '${cartdata[widget.index]['qty'].toString()}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
          ),
          padding(
            l: MediaQuery.of(context).size.width * 0.019,
            t: 0,
            r: 0,
            b: 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  cartdata[widget.index]['qty']++;
                });
                widget.onUpdate();
              },
              child: Icon(Icons.add, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}

class bottomsheet extends StatelessWidget {
  bottomsheet();

  double total_itemprice() {
    double total = 0;
    for (var item in cartdata) {
      total += item['price'] * item['qty'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.5,
      maxChildSize: 0.8,
      builder: (context, ScrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(21),
              topRight: Radius.circular(21),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Checkout',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                underline(width: double.infinity, height: 0),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return underline(
                        width: double.infinity,
                        height: 0.07,
                        widget: commrow(context, index),
                      );
                    },
                  ),
                ),
                underline(
                  width: double.infinity,
                  height: 0.07,
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Cost',  style: TextStyle(fontSize: 18, color: Color(0xff7c7c7c)),),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '\$${total_itemprice().toString()}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(child: Icon(Icons.chevron_right),),
                      ],
                    ),),
                    ],
                  ),
                ),
                Text(
                  'By placing an order you agree to our Terms And Conditions',
                  textAlign: TextAlign.center,
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.87,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: button(
                    onpressed: () {
                      Navigator.pushNamed(context, 'order_accepted');
                    },
                    child: Text(
                      'Place Order',
                      style: TextStyle(color: Color(0xffffffff), fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget commrow(context, index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          data[index]['title'],
          style: TextStyle(fontSize: 18, color: Color(0xff7c7c7c)),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              data[index]['subttl'],
              SizedBox(child: data[index]['icon']),
            ],
          ),
        ),
      ],
    );
  }
}

List<Map<String, dynamic>> data = [
  {
    'title': 'Delevery',
    'subttl': Text(
      'Select Method',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    ),
    'icon': Icon(Icons.chevron_right),
  },
  {
    'title': 'Payment',
    'subttl': Image.asset('assets/paymentcart.png'),
    'icon': Icon(Icons.chevron_right),
  },
  {
    'title': 'Promo Code',
    'subttl': Text(
      'Pick discount',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    ),
    'icon': Icon(Icons.chevron_right),
  },

];
