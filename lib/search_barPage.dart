import 'package:flutter/material.dart';
import 'common_widget.dart';
import 'package:flutter/cupertino.dart';
import 'home_screen.dart';

class search extends StatefulWidget {
  search();

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  final TextEditingController controller =TextEditingController();
  final FocusNode focusnode=FocusNode();
List itemList=fruits;
 List FilteritemList=[];

  @override
  void initState() {
    super.initState();
    FilteritemList=itemList;
    Future.delayed(Duration(milliseconds: 200),(){
      FocusScope.of(context).requestFocus(focusnode);
    });
    controller.addListener((){
      filterSearch(controller.text);
    });
  }
  void filterSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        FilteritemList = itemList;
      });
    } else {
      final result = itemList.where((item) {
        return item['title']
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList();

      setState(() {
        FilteritemList = result;
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    focusnode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: con(
        wd: double.infinity,
        ht: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        widget: Column(
          children: [
            SizedBox(height: 60),
            commonpadding(
              width: 0.04,
              height: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonsizebox(
                    width: 0.78,
                    height: 0.06,
                    child: SearchBar(
                      focusNode: focusnode,
                      controller: controller,
                      autoFocus: true,
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
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'filter_screen');
                    },
                    icon: Icon(CupertinoIcons.slider_horizontal_3, size: 30),
                  ),
                ],
              ),
            ),
                Expanded(
                child:  commonpaddingall(
            top: 0.02,
              left: 0.03,
              right: 0.03,
              bottom: 0.02,
              child:FilteritemList.isEmpty
                  ? Center(
                child: Text(
                  "No products found",
                  style: TextStyle(fontSize: 16),
                ),
              )
                  : GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 230,
                      mainAxisExtent: MediaQuery.of(context).size.height * 0.3,
                      crossAxisSpacing: MediaQuery.of(context).size.width * 0.015,
                      mainAxisSpacing: MediaQuery.of(context).size.height * 0.015,
                      childAspectRatio: 0.4,
                    ),
                    itemCount: FilteritemList.length,
                    itemBuilder: (context, index) {
                      final item = FilteritemList[index];
                      return common_container(product: item);
                    },
                  ),
                ),
        ),
          ],
        ),
      ),
    );
  }
}
