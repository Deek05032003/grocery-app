import 'package:flutter/material.dart';
import 'common_widget.dart';
import 'log in.dart';

class locat extends StatefulWidget {
  locat();

  @override
  State<locat> createState() => _locatState();
}

class _locatState extends State<locat> {
  String? selectedzone;
  String? selectedarea;

  final Map<String, List<String>> zonearea = {
    "Dhamtari": ["Arjuni", "Chhati", "Sambalpur"],
    "Bhilai": ["sector", "risali", "katulbord"],
    "Raipur": ["santoshinagar", 'Telibamdha', "Ramnagar"],
    "kurud": ["dandesara", "magarload", "megha"],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/back.png'),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                padding(
                  l: 10,
                  r: 0,
                  t: 50,
                  b: 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.chevron_left, size: 30),
                  ),
                ),
                padding(
                  l: 100,
                  t: 40,
                  r: 100,
                  b: 0,
                  child: con(
                    wd: MediaQuery.of(context).size.width * 0.75,
                    ht: MediaQuery.of(context).size.height * 0.17,
                    widget: Image.asset(
                      'assets/img.png',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.17,
                    ),
                  ),
                ),
                padding(
                  t: 30,
                  l: 80,
                  r: 0,
                  b: 0,
                  child: Text(
                    'Select Your Location',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                ),
                padding(
                  b: 0,
                  l: 50,
                  r: 0,
                  t: 10,
                  child: Text(
                    'Switch on your location to stay in tune with',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                ),
                padding(
                  l: 100,
                  b: 0,
                  r: 0,
                  t: 0,
                  child: Text(
                    'whats happening in your area',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                ),
                padding(
                  b: 0,
                  l: 20,
                  r: 0,
                  t: 50,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.12,
                    child: DropdownMenu<String>(
                      width: MediaQuery.of(context).size.width * 0.9,
                      trailingIcon: Transform.rotate(
                        angle: 90 * 3.1416 / 180,
                        child: Icon(Icons.chevron_right),
                      ),
                      label: Text(
                        'Your Zone',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff7c7c7c),
                        ),
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedzone = value;
                          selectedarea = null;
                        });
                      },
                      dropdownMenuEntries: zonearea.keys
                          .map((z) => DropdownMenuEntry(value: z, label: z))
                          .toList(),
                      inputDecorationTheme: InputDecorationTheme(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffe2e2e2),
                            width: 1,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffe2e2e2),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                padding(
                  b: 0,
                  l: 20,
                  r: 0,
                  t: 50,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.12,
                    child: DropdownMenu<String>(
                      hintText: 'Types of your area',
                      width: MediaQuery.of(context).size.width * 0.9,
                      enabled: selectedzone != null,
                      trailingIcon: Transform.rotate(
                        angle: 90 * 3.1416 / 180,
                        child: Icon(Icons.chevron_right),
                      ),
                      label: Text(
                        'Your Area',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff7c7c7c),
                        ),
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedarea = value;
                        });
                      },
                      dropdownMenuEntries: selectedzone == null
                          ? []
                          : zonearea[selectedzone]!
                                .map(
                                  (a) => DropdownMenuEntry(value: a, label: a),
                                )
                                .toList(),
                      inputDecorationTheme: InputDecorationTheme(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffe2e2e2),
                            width: 1,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffe2e2e2),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                padding(
                  b: 0,
                  l: 40,
                  r: 0,
                  t: 100,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedzone != null && selectedarea != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(backgroundColor: Color(0xff53b175),
                              content: Text(
                                'Submitted',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(backgroundColor: Colors.redAccent,
                              content: Text('Please select Zone and Area'),
                            ),
                          );
                          return;
                        }
                        Navigator.pushNamed(context, 'log in');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff53b175),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
