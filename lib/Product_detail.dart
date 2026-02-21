import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/common_widget.dart';
import 'package:project/favorites.dart';
import 'package:project/my_cart.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:math' as math;
import 'home_screen.dart';

class product_detail extends StatefulWidget {
  final Map<String, dynamic> product;

  product_detail({super.key, required this.product});

  @override
  State<product_detail> createState() => _product_detailState();
}

class _product_detailState extends State<product_detail> {
  int cur_in = 0;
  int quantity_product = 1;
  bool isFavorite = false;
  int rating = 0;
  double price = 4.99;
  bool showabout=false;
  double get totalprice {
    return quantity_product * price;
  }

  @override
  void initState() {
    super.initState();

    price = double.parse(
      widget.product['price'].toString().replaceAll('\$', ''),
    );
    isFavorite = favoritelist.any(
      (item) => item['title'] == widget.product['title'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: con(
        wd: double.infinity,
        ht: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        widget: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              con(
                wd: double.infinity,
                ht: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  color: Color(0xfff2f3f2),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    padding(
                      l: MediaQuery.of(context).size.width * 0.02,
                      t: MediaQuery.of(context).size.height * 0.037,
                      r: 0,
                      b: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.chevron_left, size: 30),
                          ),
                          padding(
                            l: 0,
                            t: 0,
                            r: MediaQuery.of(context).size.width * 0.02,
                            b: 0,
                            child: IconButton(
                              onPressed: () {
                                Share.share('${widget.product['title']}');
                              },
                              icon: Icon(Icons.ios_share, size: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        height: MediaQuery.of(context).size.height * 0.2,
                        onPageChanged: (index, reason) {
                          setState(() {
                            cur_in = index;
                          });
                        },
                      ),
                      items: [
                        Image.asset(
                          widget.product['img'],
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.23,
                        ),
                        Image.asset(
                          widget.product['img'],
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.23,
                        ),
                      ],
                    ),
                    padding(
                      l: 0,
                      t: MediaQuery.of(context).size.height * 0.017,
                      r: 0,
                      b: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [wid(0), wid(1)],
                      ),
                    ),
                  ],
                ),
              ),
              padding(
                l: MediaQuery.of(context).size.width * 0.05,
                t: MediaQuery.of(context).size.height * 0.02,
                r: 0,
                b: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product['title'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    padding(
                      r: MediaQuery.of(context).size.width * 0.03,
                      l: 0,
                      t: 0,
                      b: 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;

                            if (isFavorite) {
                              favoritelist.add(widget.product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text('Added to FavoriteList'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            } else {
                              favoritelist.removeWhere(
                                (item) =>
                                    item['title'] == widget.product['title'],
                              );
                            }
                          });
                        },
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          size: 30,
                          color: isFavorite ? Colors.red : Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              padding(
                l: MediaQuery.of(context).size.width * 0.05,
                t: 0,
                r: 0,
                b: 0,
                child: Text(
                  widget.product['quantity'],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xff7c7c7c),
                  ),
                ),
              ),
              padding(
                l: MediaQuery.of(context).size.width * 0.05,
                t: MediaQuery.of(context).size.width * 0.06,
                r: 0,
                b: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    con(
                      wd: MediaQuery.of(context).size.width * 0.4,
                      ht: MediaQuery.of(context).size.height * 0.05,
                      widget: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (quantity_product > 1) {
                                setState(() {
                                  quantity_product--;
                                });
                              }
                            },
                            child: Icon(
                              Icons.horizontal_rule,
                              color: Colors.black54,
                            ),
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
                                  quantity_product.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
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
                                  quantity_product++;
                                });
                              },
                              child: Icon(Icons.add, color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    ),
                    padding(
                      r: MediaQuery.of(context).size.width * 0.03,
                      l: 0,
                      t: 0,
                      b: 0,
                      child: Text(
                        '\$${totalprice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              com(),
              padding(
                l: MediaQuery.of(context).size.width * 0.05,
                t: MediaQuery.of(context).size.width * 0.06,
                r: 0,
                b: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Detail',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    padding(
                      r: MediaQuery.of(context).size.width * 0.03,
                      t: 0,
                      l: 0,
                      b: 0,
                      child: IconButton(onPressed: (){
                        setState(() {
                          showabout=!showabout;
                        });
                      },
                        icon: Transform.rotate(
                          angle: showabout?math.pi / 2:0,
                          child: Icon(Icons.chevron_right, size: 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedSize(duration: Duration(milliseconds: 250),curve: Curves.easeInBack,
                child:showabout? padding(
                  b: 0,
                  l: MediaQuery.of(context).size.width * 0.05,
                  r: MediaQuery.of(context).size.width * 0.017,
                  t: MediaQuery.of(context).size.height * 0.017,
                  child: Text(
                    widget.product['about']??'',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff7c7c7c),
                    ),
                  ),
                ):SizedBox.shrink(),
              ),
              com(),
              padding(
                l: MediaQuery.of(context).size.width * 0.05,
                t: MediaQuery.of(context).size.height * 0.017,
                r: 0,
                b: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nutritions',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    padding(
                      l: MediaQuery.of(context).size.width * 0.45,
                      r: 0,
                      t: 0,
                      b: 0,
                      child: con(
                        wd: MediaQuery.of(context).size.width * 0.11,
                        ht: MediaQuery.of(context).size.height * 0.028,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          border: Border.all(color: Colors.grey.shade100),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        widget: Center(
                          child: Text(
                            '100gr',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    padding(
                      r: MediaQuery.of(context).size.width * 0.02,
                      l: 0,
                      t: 0,
                      b: 0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chevron_right, size: 30),
                      ),
                    ),
                  ],
                ),
              ),
              com(),
              padding(
                l: MediaQuery.of(context).size.width * 0.05,
                t: MediaQuery.of(context).size.height * 0.018,
                r: 0,
                b: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Review',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    padding(
                      l: MediaQuery.of(context).size.width * 0.38,
                      r: 0,
                      t: 0,
                      b: 0,
                      child: con(
                        wd: MediaQuery.of(context).size.width * 0.267,
                        ht: MediaQuery.of(context).size.height * 0.06,
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: List.generate(5, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  rating = index + 1;
                                });
                              },
                              child: Icon(
                                index < rating ? Icons.star : Icons.star_border,
                                size: 20,
                                color: index < rating
                                    ? Colors.yellow
                                    : Colors.black,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    padding(
                      b: 0,
                      l: 0,
                      r: MediaQuery.of(context).size.width * 0.02,
                      t: 0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chevron_right, size: 30),
                      ),
                    ),
                  ],
                ),
              ),
              padding(
                b: 0,
                l: MediaQuery.of(context).size.width * 0.06,
                r: 0,
                t: MediaQuery.of(context).size.width * 0.02,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.87,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: button(
                    onpressed: () {
                      int index = cartdata.indexWhere(
                        (item) => item['key'] == widget.product['key'],
                      );
                      if (index == -1) {
                        cartdata.add({...widget.product, 'qty': 1});
                      } else {
                        cartdata[index]['qty']++;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 1),
                          content: Text('Added to Cart'),
                        ),
                      );
                    },
                    child: Text(
                      'Add To Basket',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget wid(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      width: cur_in == index
          ? MediaQuery.of(context).size.width * 0.06
          : MediaQuery.of(context).size.width * 0.02,
      height: MediaQuery.of(context).size.height * 0.008,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: cur_in == index ? Color(0xff53b175) : Colors.grey,
      ),
    );
  }
}
