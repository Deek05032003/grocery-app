import 'package:flutter/material.dart';
import 'package:project/common_widget.dart';
import 'package:project/my_cart.dart';
import 'Product_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project/api/log_api.dart';

List<Map<String, dynamic>> fruits = [
  {
    'key': 'banana',
    'img': 'assets/bananahome.png',
    'title': 'Organic Banana',
    'quantity': '1kg,Priceg',
    'price': 4.99,
    'about':
        'Some horticulturists believe that bananas were the first fruit on earth. Their origin is placed in Southeast Asia, in the jungles of Malaysis',
    'addicn': 'assets/plus.png',
    'qty': 1,
  },
  {
    'key': 'apple',
    'img': 'assets/applehpme.png',
    'title': 'Red Apple',
    'quantity': '1kg,Priceg',
    'price': 4.99,
    'about':
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
    'addicn': 'assets/plus.png',
    'qty': 1,
  },
  {
    'key': 'pineapple',
    'img': 'assets/pineapplehome.png',
    'title': 'Pine Apple',
    'quantity': '1kg,priceg',
    'price': 4.99,
    'about':
        'The pineapple (Ananas comosus) is a popular, juicy tropical fruit native to South America, known for its sweet-tart taste, tough spiky exterior, and leafy crown, actually a fusion of many flowers forming a single fruit',
    'addicn': 'assets/plus.png',
    'qty': 1,
  },
  {
    'key': 'banana',
    'img': 'assets/bananahome.png',
    'title': 'Organic Banana',
    'quantity': '1kg,Priceg',
    'price': 4.99,
    'about':
        'Some horticulturists believe that bananas were the first fruit on earth. Their origin is placed in Southeast Asia, in the jungles of Malaysis',
    'addicn': 'assets/plus.png',
    'qty': 1,
  },
  {
    'key': 'apple',
    'img': 'assets/applehpme.png',
    'title': 'Red Apple',
    'quantity': '1kg,Priceg',
    'price': 4.99,
    'about':
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
    'addicn': 'assets/plus.png',
    'qty': 1,
  },
  {
    'key': 'pineapple',
    'img': 'assets/pineapplehome.png',
    'title': 'Pine Apple',
    'quantity': '1kg,priceg',
    'price': 4.99,
    'about':
        'The pineapple (Ananas comosus) is a popular, juicy tropical fruit native to South America, known for its sweet-tart taste, tough spiky exterior, and leafy crown, actually a fusion of many flowers forming a single fruit',
    'addicn': 'assets/plus.png',
    'qty': 1,
  },
];
List<Map<String, dynamic>> veglist = [
  {
    'key': 'cap',
    'img': 'assets/capsihome.png',
    'title': 'Capsicum',
    'quantity': '1kg,Priceg',
    'price': 4.99,
    'about':
        'All chili peppers and bell peppers belong to the genus Capsicum. There are various potential health benefits associated with Capsicum, including managing metabolic syndrome and pain.',
    'addicn': 'assets/plus.png',
    'qty': 1,
  },

  {
    'key': 'ginger',
    'img': 'assets/gingerhome.png',
    'title': 'Ginger',
    'quantity': '1kg,Priceg',
    'price': 4.99,
    'about':
        'Ginger is one of the most popular spices in the world and comes from the underground stem of the ginger plant.',
    'addicn': 'assets/plus.png',
    'qty': 1,
  },
  {
    'key': 'cap',
    'img': 'assets/capsihome.png',
    'title': 'Capsicum',
    'quantity': '1kg,Priceg',
    'price': 4.99,
    'about':
        'All chili peppers and bell peppers belong to the genus Capsicum. There are various potential health benefits associated with Capsicum, including managing metabolic syndrome and pain.',
    'addicn': 'assets/plus.png',
    'qty': 1,
  },

  {
    'key': 'ginger',
    'img': 'assets/gingerhome.png',
    'title': 'Ginger',
    'quantity': '1kg,Priceg',
    'price': 4.99,
    'about':
        'Ginger is one of the most popular spices in the world and comes from the underground stem of the ginger plant.',
    'addicn': 'assets/plus.png',
    'qty': 1,
  },
];
List<Map<String, dynamic>> nonveg = [
  {
    'key': 'meat',
    'img': 'assets/beefhome.png',
    'title': 'Mutton',
    'quantity': '1kg,Priceg',
    'price': 4.99,
    'about':
        'Non-vegetarian Recipes | 125 Indian Meat RecipesMutton, typically goat meat in South Asia, is a popular non-vegetarian protein source, rich in iron, zinc, B vitamins, and essential for muscle health,',
    'addicn': 'assets/plus.png',
    'qty': 1,
  },
  {
    'key': 'chicken',
    'img': 'assets/chickenhome.png',
    'title': 'Broiler Chicken',
    'quantity': '1kg,Priceg',
    'price': 4.99,
    'about':
        ' chicken meat consumed as part of a non-vegetarian diet, valued for its high-quality protein, B vitamins, iron, and zinc, supporting muscle, brain, and immune health, ',
    'addicn': 'assets/plus.png',
    'qty': 1,
  },
  {
    'key': 'meat',
    'img': 'assets/beefhome.png',
    'title': 'Mutton',
    'quantity': '1kg,Priceg',
    'price': 4.99,
    'about':
        'Non-vegetarian Recipes | 125 Indian Meat RecipesMutton, typically goat meat in South Asia, is a popular non-vegetarian protein source, rich in iron, zinc, B vitamins, and essential for muscle health,',
    'addicn': 'assets/plus.png',
    'qty': 1,
  },
  {
    'key': 'chicken',
    'img': 'assets/chickenhome.png',
    'title': 'Broiler Chicken',
    'quantity': '1kg,Priceg',
    'price': 4.99,
    'about':
        ' chicken meat consumed as part of a non-vegetarian diet, valued for its high-quality protein, B vitamins, iron, and zinc, supporting muscle, brain, and immune health, ',
    'addicn': 'assets/plus.png',
    'qty': 1,
  },
];

class homes extends StatefulWidget {
  homes();

  @override
  State<homes> createState() => _homesState();
}

class _homesState extends State<homes> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authenticateLogin();
    });
  }
  void authenticateLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   String? token = prefs.getString("token");

    // if (!mounted) return;

   // if (token != null) {
      //print("Saved Token:${data["access_token"]}");
    //   Navigator.pushReplacementNamed(context, 'log in');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: con(
        wd: double.infinity,
        ht: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        widget: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonpaddingall(
                top: 0.05,
                child: Center(child: Image.asset('assets/carhome.png')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on),
                  Text(
                    'Dhaka ,Banassare',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4c4f4d),
                    ),
                  ),
                ],
              ),
              commonpadding(
                width: 0.08,
                height: 0.02,
                child: commonsizebox(
                  width: 0.85,
                  height: 0.06,
                  child: SearchBar(
                    autoFocus: false,
                    onTap: () {
                      Navigator.pushNamed(context, 'search_barPage');
                    },
                    leading: Icon(Icons.search),
                    hintText: 'Search Store',
                    hintStyle: MaterialStateProperty.all(
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xfff2f3f2),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                  ),
                ),
              ),
              commonpadding(
                width: 0.05,
                height: 0.0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Image.asset('assets/banner.png', fit: BoxFit.fill),
                ),
              ),
              con(
                wd: double.infinity,
                ht: MediaQuery.of(context).size.height * 0.57,
                widget: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      categoryRow('Exclusive Offer'),
                      commonpadding(
                        width: 0.02,
                        height: 0,
                        child: commonlist(fruits),
                      ),
                      categoryRow('Best Selling'),
                      commonpadding(
                        width: 0.02,
                        height: 0,
                        child: commonlist(veglist),
                      ),
                      categoryRow('Groceries'),
                      commonpadding(
                        width: 0.02,
                        height: 0.015,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.13,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: varietylist.length,
                            itemBuilder: (context, index) {
                              return commonpadding(
                                width: 0.02,
                                height: 0,
                                child: categoriseItem(index: index),
                              );
                            },
                          ),
                        ),
                      ),

                      commonpadding(
                        width: 0.02,
                        height: 0.04,
                        child: commonlist(nonveg),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget commonlist(List<Map<String, dynamic>> data) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(data.length, (index) {
            final item = data[index];
            return common_container(product: item);
          }),
        ],
      ),
    );
  }

  Widget categoryRow(String category) {
    return commonpadding(
      width: 0.06,
      height: 0.015,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'See all',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff53b175),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> varietylist = [
  {'img': 'assets/rice.png', 'title': 'Pulses', 'color': Color(0xffffecd2)},
  {'img': 'assets/dryhome.png', 'title': 'Rices', 'color': Color(0xffdff2d8)},
  {'img': 'assets/rice.png', 'title': 'Pulses', 'color': Color(0xfffadadd)},
  {'img': 'assets/dryhome.png', 'title': 'Rices', 'color': Color(0xffffecd2)},
];

class common_container extends StatelessWidget {
  final Map<String, dynamic> product;

  const common_container({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return commonpaddingall(
      left: 0.02,
      top: 0.01,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => product_detail(product: product),
            ),
          );
        },
        child: con(
          wd: MediaQuery.of(context).size.width * 0.42,
          ht: MediaQuery.of(context).size.height * 0.29,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 1),
            borderRadius: BorderRadius.circular(21),
          ),
          widget: commonpadding(
            width: 0.02,
            height: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: commonsizebox(
                    width: 0.3,
                    height: 0.125,
                    child: Image.asset(product['img']),
                  ),
                ),
                Text(
                  product['title'],
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                Text(
                  product['quantity'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black45,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product['price'].toString()}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        int index = cartdata.indexWhere(
                          (item) => item['key'] == product['key'],
                        );
                        if (index == -1) {
                          cartdata.add({...product, 'qty': 1});

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 1),
                              content: Text('Added to cart'),
                            ),
                          );
                        } else {
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class categoriseItem extends StatelessWidget {
  final int index;

  categoriseItem({Key? key, required this.index});

  @override
  Widget build(BuildContext context) {
    return con(
      wd: MediaQuery.of(context).size.width * 0.65,
      ht: MediaQuery.of(context).size.height * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: varietylist[index]['color'],
      ),
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          commonpaddingall(
            left: 0.04,
            child: SizedBox(child: Image.asset(varietylist[index]['img'])),
          ),
          commonpaddingall(
            right: 0.17,
            child: SizedBox(
              child: Text(
                varietylist[index]['title'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
