import 'package:flutter/material.dart';
import 'package:project/common_widget.dart';
import 'home_screen.dart';
import 'explore_page.dart';
import 'my_cart.dart';
import 'favorites.dart';
import 'account.dart';

class bottum extends StatefulWidget {
  @override
  State<bottum> createState() => _bottumState();
}

class _bottumState extends State<bottum> {
  int currentin = 0;

  final List<Widget> page = [
    homes(),
    explore(),
    my_cart(),
    my_favorite(),
    my_account(),
  ];

  void ontap(index) {
    setState(() {
      currentin = index;
    });
  }
int item_count(){
    int total=0;
    for(var item in cartdata){
      total +=item['qty'] as int;
    }
    return total;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentin],

      bottomNavigationBar: con(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(21),
            topRight: Radius.circular(21),
          ),
        ),
        widget: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: currentin,
          selectedItemColor: Color(0xff53b175),
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          selectedIconTheme: IconThemeData(size: 30),
          unselectedIconTheme: IconThemeData(size: 30),
          onTap: ontap,
          items:  [
            BottomNavigationBarItem(
              icon: Icon(Icons.storefront_outlined),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_search_outlined),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon:cartShopingIcon(),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined, size: 30),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
  Widget cartShopingIcon(){
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(Icons.shopping_cart_checkout_outlined),
        if(item_count()>0)
          Positioned(
           right: -6,
            top: -4,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              child: Center(
                child: Text(
                 item_count().toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
