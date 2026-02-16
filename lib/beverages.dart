import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/common_widget.dart';
import 'package:project/home_screen.dart';
import 'my_cart.dart';
import 'api/product_service.dart';
import 'package:project/Product_detail.dart';

class bevrages extends StatelessWidget {
  final String categoryId;
  final String title;

  bevrages({required this.categoryId, required this.title});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> item = getCategoryData(categoryId);
    return Scaffold(
      body: con(
        wd: double.infinity,
        ht: double.infinity,
        decoration: BoxDecoration(color: Color(0xffffffff)),
        widget: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.chevron_left, size: 30),
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'filter_screen');
                    },
                    icon: Icon(CupertinoIcons.slider_horizontal_3),
                  ),
                ],
              ),
            ),
            Expanded(child: grid(dataList: item)),
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> getCategoryData(String key) {
  switch (key) {
    case 'beverages':
      return beverageList;
    case 'fruits':
      return fruits;
    case 'snacks':
      return snacksList;
    case 'vegetable':
      return veglist;
    case 'nonveg':
      return nonveg;
    default:
      return [];
  }
}

List<Map<String, dynamic>> snacksList = [];
List<Map<String, dynamic>> beverageList = [
  {
    'img': 'assets/cokebeverage.png',
    'title': 'Diet Coke',
    'quantity': "355ml,Price",
    'price': 1.99,
    'plusimg': 'assets/plus.png',
  },
  {
    'img': 'assets/spritebeverage.png',
    'title': 'Sprite Can',
    'quantity': "325ml,Price",
    'price': 1.50,
    'plusimg': 'assets/plus.png',
  },
  {
    'img': 'assets/applejuicebeve.png',
    'title': 'Apple & Grape Juice',
    'quantity': "2lr,Price",
    'price': 15.99,
    'plusimg': 'assets/plus.png',
  },
  {
    'img': 'assets/orangejuicebeve.png',
    'title': 'Orange Juice',
    'quantity': "2lr,Price",
    'price': 15.99,
    'plusimg': 'assets/plus.png',
  },
  {
    'img': 'assets/cocacolabeve.png',
    'title': 'Coca Cola Can',
    'quantity': "325ml,Price",
    'price': 4.99,
    'plusimg': 'assets/plus.png',
  },
  {
    'img': 'assets/pepsibeve.png',
    'title': 'Pepsi Can',
    'quantity': "330ml,Price",
    'price': 4.99,
    'plusimg': 'assets/plus.png',
  },
  {
    'img': 'assets/spritebeverage.png',
    'title': 'Sprite Can',
    'quantity': "325ml,Price",
    'price': 4.99,
    'plusimg': 'assets/plus.png',
  },
];

class communcontainer extends StatelessWidget {
  communcontainer({required this.list});

  final Map<String, dynamic> list;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => product_detail(product:list),
            ),
          );
        },
        child:  Container(
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.circular(11),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.height * 0.005,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                  child: Image.asset(list['img']),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
                child: Text(
                  list['title'],
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.018,
                child: Text(
                  list['quantity'],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black45,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${list['price'].toString()}',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {
                        int index = cartdata.indexWhere(
                          (item) => item['key'] == list['key'],
                        );
                        if (index == -1) {
                          cartdata.add({...list, 'qty': 1});

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 1),
                            content: Text('Added to cart'),
                          ),
                        );}
                        else {
                          cartdata.removeAt(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 1),
                              content: Text('Removed from cart'),
                            ),
                          );
                        }
                      },
                      icon: Image.asset('assets/plus.png'),
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
}

class grid extends StatelessWidget {
  final List<Map<String, dynamic>> dataList;

  grid({required this.dataList});

  @override
  Widget build(BuildContext context) {
    //  final itemList = dataList;
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.03,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 215,
        mainAxisExtent: MediaQuery.of(context).size.height * 0.28,
        crossAxisSpacing: MediaQuery.of(context).size.width * 0.018,
        mainAxisSpacing: MediaQuery.of(context).size.height * 0.018,
        childAspectRatio: 0.72,
      ),
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return communcontainer(list: dataList[index]);
      },
    );
  }
}
