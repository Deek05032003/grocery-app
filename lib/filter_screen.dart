import 'package:flutter/material.dart';
import 'package:project/common_widget.dart';

class filter extends StatefulWidget {
  filter();

  @override
  State<filter> createState() => _filterState();
}

class _filterState extends State<filter> {
  List<String> category = [
    'Eggs',
    'Noodles & Pasta',
    'Chips & Crisp',
    'Fast Food',
  ];
  List<String> brand = [
    'Indivisual Collection',
    'Cocola',
    'Ifad',
    'Kaji Farmas',
  ];
  List<bool> select = [false, false, false, false];
  List<bool> select2 = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
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
                children: [
                  IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.close)),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Filter',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            con(
              wd: double.infinity,
              ht: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                color: Color(0xfff2f3f2),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(19),
                  topLeft: Radius.circular(25),
                ),
              ),
              widget: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.03,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only( bottom: MediaQuery.of(context).size.height*0.032),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ...List.generate(category.length, (index) {
                        return CheckboxTheme(
                          data: CheckboxThemeData(side: BorderSide(color: Colors.black38,width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: CheckboxListTile(
                            dense: true,
                            visualDensity: VisualDensity(vertical: -4),
                            title: Text(
                              category[index],
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,
                                color: select[index]
                                    ? Color(0xff53b175)
                                    : Colors.black,
                              ),
                            ),
                            value: select[index],
                            activeColor: Color(0xff53b175),
                            onChanged: (bool? value) {
                              setState(() {
                                select[index] = value!;
                              });
                            },
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        );
                      }),
                      Padding(
                        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.038,
                        bottom: MediaQuery.of(context).size.height*0.032),
                        child: Text(
                          'Brand',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ...List.generate(brand.length, (index) {
                        return CheckboxTheme(
                          data: CheckboxThemeData(side: BorderSide(color: Colors.black38,width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: CheckboxListTile(
                            dense: true,
                            visualDensity: VisualDensity(vertical: -4),
                            title: Text(
                              brand[index],
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,
                                color: select2[index]
                                    ? Color(0xff53b175)
                                    : Colors.black,
                              ),
                            ),
                            value: select2[index],
                            activeColor: Color(0xff53b175),
                            onChanged: (bool? value) {
                              setState(() {
                                select2[index] = value!;
                              });
                            },
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        );
                      }),
                      padding(
                        b: 0,
                        l: MediaQuery.of(context).size.width * 0.06,
                        r: 0,
                        t: MediaQuery.of(context).size.width * 0.3,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.87,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: button(
                            onpressed: () {},
                            child: Text(
                              'Apply Flutter',
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
            ),
          ],
        ),
      ),
    );
  }
}
