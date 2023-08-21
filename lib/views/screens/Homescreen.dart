import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'Body1.dart';
import 'Body2.dart';
import 'Body3.dart';

class Homescreen extends StatefulWidget {
  //...........
  String email;
  Homescreen({super.key, required this.email});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  //..............
  int currentIndex = 0;
  List<Widget> page = [
    Body1(),
    Body2(),
    Body3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(161, 255, 153, 0),
        automaticallyImplyLeading: false,
        actions: [Icon(Icons.list)],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(); //............
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 600,
            child: page[currentIndex],
          ),
          /* Center(
              child: Text(
            widget.email,
            style: TextStyle(fontSize: 30),
          )),*/
        ],
      ),
      //  body: page[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_4_rounded), label: 'profile'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Main'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourits'),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
            print(value);
          });
        },
      ),
    );
  }
}
