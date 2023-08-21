//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body1 extends StatefulWidget {
  const Body1({super.key});

  @override
  State<Body1> createState() => _Body1State();
}

class _Body1State extends State<Body1> {
  String email = "";
  String password = "";

  getCachedEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? '--';

    setState(() {});
  }

  getCachedPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    password = prefs.getString('Password') ?? '--';

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCachedEmail();
    getCachedPassword();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(
              'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50'),
        ),
        SizedBox(height: 30),
        Text("Your email: \n  " + "    $email"),
        SizedBox(height: 10),
        Text("Your password: \n  " + " $password"),
      ]),
    ));
  }
}
