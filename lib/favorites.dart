import 'package:flutter/material.dart';
import 'package:project/common_widget.dart';
import 'package:provider/provider.dart';
List<Map<String, dynamic>> favoritelist = [];
class my_favorite extends StatefulWidget {
  my_favorite();

  @override
  State<my_favorite> createState() => _my_favoriteState();
}

class _my_favoriteState extends State<my_favorite> {
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
                  'Favorurite',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            underline(width: double.infinity, height: 0),
            Expanded(
              child: favoritelist.isEmpty
                  ? Center(
                      child: Text(
                        'Favorite list is Empty',
                        style: TextStyle(fontSize: 24),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: favoritelist.length,
                      itemBuilder: (contex, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03,
                          ),
                          child: underline(
                            width: 0.8,
                            height: 0.13,
                            widget: commonrow(index),
                          ),
                        );
                      },
                    ),
            ),
            padding(
              b: MediaQuery.of(context).size.width * 0.07,
              l: MediaQuery.of(context).size.width * 0.06,
              r: 0,
              t: MediaQuery.of(context).size.width * 0.07,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.87,
                height: MediaQuery.of(context).size.height * 0.07,
                child: button(
                  onpressed: () {},
                  child: Text(
                    'Add All To Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
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

  Widget commonrow(int index) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.14,
          height: MediaQuery.of(context).size.width * 0.12,
          child: Image.asset(favoritelist[index]['img'], fit: BoxFit.contain),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                favoritelist[index]['title'],
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Text(
                favoritelist[index]['quantity'],
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff7c7c7c),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Row(
            children: [
              Text(
                '\$${favoritelist[index]['price'].toString()}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Expanded(child: Icon(Icons.chevron_right)),
            ],
          ),
        ),
      ],
    );
  }
}


