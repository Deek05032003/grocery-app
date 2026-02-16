import 'package:flutter/material.dart';
import 'common_widget.dart';
import 'beverages.dart';
import 'api/Category_service.dart';

class explore extends StatefulWidget {
  explore();

  @override
  State<explore> createState() => _exploreState();
}

class _exploreState extends State<explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: con(
        wd: double.infinity,
        ht: double.infinity,
        decoration: BoxDecoration(color: Color(0xffffffff)),
        widget: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              padding(
                l: MediaQuery.of(context).size.width * 0.35,
                t: MediaQuery.of(context).size.height * 0.08,
                r: 0,
                b: 0,
                child: Text(
                  'Find Product',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              padding(
                l: MediaQuery.of(context).size.width * 0.07,
                t: MediaQuery.of(context).size.height * 0.02,
                r: 0,
                b: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: SearchBar(
                    onTap: (){
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

              padding(
                t: MediaQuery.of(context).size.height * 0.02,
                l: 0,
                r: 0,
                b: 0,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                  color: Color(0xffffffff),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.03,
                            right: MediaQuery.of(context).size.width * 0.03,
                            top: MediaQuery.of(context).size.height * 0.01,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                mainAxisExtent:
                                    MediaQuery.of(context).size.height * 0.22,
                                crossAxisSpacing:
                                    MediaQuery.of(context).size.width * 0.018,
                                mainAxisSpacing:
                                    MediaQuery.of(context).size.height * 0.018,
                                childAspectRatio: 0.4,
                              ),
                          itemCount: datalist.length,
                          itemBuilder: (context, index) {
                            return com_container(
                              keyvalue: datalist[index]['key'],
                              title: datalist[index]['text'],
                              index: index,
                            );
                          },
                        ),
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
}

List<Map<String, dynamic>> datalist = [
  {
    'key': 'fruits',
    'bgcolor': Color(0xffffecd2),
    'color': Color(0xFFFFE2B8),
    'img': 'assets/vegeexplor.png',
    'text': 'Fresh Fruits & Vegetables',
  },
  {
    'key': 'oil',
    'bgcolor': Color(0xffdff2d8),
    'color': Color(0xFFCDE6C3),
    'img': 'assets/oilexlore.png',
    'text': 'Cooking Oil & Ghee',
  },
  {
    'key': 'nonveg',
    'bgcolor': Color(0xFFf6f3ff),
    'color': Color(0xFFD3B0E0),
    'img': 'assets/nonvegexplore.png',
    'text': 'Meat & Fish',
  },
  {
    'key': 'snacks',
    'bgcolor': Color(0xFFc2e9fb),
    'color': Color(0xFFB7DFF5),
    'img': 'assets/bakeryexplore.png',
    'text': 'Bakery & Snacks',
  },
  {
    'key': 'egg milk',
    'bgcolor': Color(0xFFfed6e3),
    'color': Color(0xFFF7A593),
    'img': 'assets/eggmilkexplore.png',
    'text': 'Dairy & Eggs',
  },
  {
    'key': 'beverages',
    'bgcolor': Color(0xfffff1eb),
    'color': Color(0xFFFDE598),
    'img': 'assets/colddrinkexplore.png',
    'text': 'Beverages',
  },
  {
    'key': 'vegetable',
    'bgcolor': Color(0xFFdeecdd),
    'color': Color(0xFF836AF680),
    'img': 'assets/vegeexplor.png',
    'text': 'Vegetables',
  },
  {
    'key': 'snack',
    'bgcolor': Color(0xFFe9defa),
    'color': Color(0xFFD73B7780),
    'img': 'assets/bakeryexplore.png',
    'text': 'Snacks',
  },
];

class com_container extends StatelessWidget {
  final int index;
  final keyvalue;
  final title;

  com_container({
    Key? key,
    required this.index,
    required this.keyvalue,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => bevrages(
              categoryId: datalist[index]['key'],
              title: datalist[index]['text'],
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          border: Border.all(color: datalist[index]['color'], width: 1),
          color: datalist[index]['bgcolor'],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.asset(datalist[index]['img'], fit: BoxFit.fill),
              ),
              Text(
                datalist[index]['text'],
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
