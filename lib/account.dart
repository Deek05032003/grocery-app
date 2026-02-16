import 'package:flutter/material.dart';
import 'package:project/common_widget.dart';
import 'package:flutter/cupertino.dart';
import 'profile_screen.dart';
class my_account extends StatelessWidget {
  my_account();

  List<Map<String, dynamic>> dtl_data = [
    {
      'icon': Icon(Icons.shopping_bag_outlined, size: 30),
      'txt': 'Orders',
      'route':'order_detail'
    },
    {
      'icon': Icon(Icons.badge_outlined, size: 30),
      'txt': 'My Details',
      'route': 'profile_screen'
    },
    {
      'icon': Icon(Icons.location_on_outlined, size: 30),
      'txt': 'Delevery Address',
      'route':'address_screen'
    },
    {
      'icon': Icon(Icons.credit_card_outlined, size: 30),
      'txt': 'Payment Methods',
      'route': 'payment_screen'
    },
    {
      'icon': Icon(CupertinoIcons.ticket, size: 30),
      'txt': 'Promo Card',
      'route':  'promocard_screen'
    },
    {
      'icon': Icon(Icons.notifications_outlined, size: 30),
      'txt': 'Notification',
      'route':'notification_screen'
    },
    {
      'icon': Icon(Icons.help_outline, size: 30),
      'txt': 'Help',
      'route':'help_screen'
    },
    {
      'icon': Icon(Icons.info_outline_rounded, size: 30),
      'txt': 'About',
      'route':'about_screen'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffffffff),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.06,
              ),
              child: ListTile(
                leading: GestureDetector(onTap: (){
                  Navigator.pushNamed(context, 'profile_screen');
                  },
                  child: Hero(tag: 'pic',
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Text(
                      'Aradhya Sahu',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(Icons.edit_outlined, color: Color(0xff53b175)),
                  ],
                ),
                subtitle: Text(
                  'ara01@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff7c7c7c),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
              child: underline(width: double.infinity, height: 0),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                ),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: dtl_data.length,
                  itemBuilder: (context, index) {
                    return underline(
                      width: double.infinity,
                      height: 0.08,
                      widget: commonlist(context, index),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfff2f3f2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'log in');
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        size: 30,
                        color: Color(0xff53B175),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.2,
                        ),
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xff53B175),
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
  Widget commonlist(context, index) {
    return InkWell(onTap: (){
      Navigator.pushNamed(context, dtl_data[index]['route']);
    },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                dtl_data[index]['icon'],
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: Text(
                    dtl_data[index]['txt'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, size: 30),
        ],
      ),
    );
  }
}
