import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/AuthPage.dart';

class Welcome_Page extends StatefulWidget {
  const Welcome_Page({super.key});

  @override
  State<Welcome_Page> createState() => _Welcome_PageState();
}

class _Welcome_PageState extends State<Welcome_Page> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    const Image(
                      height: 200,
                      width: 200,
                      image: AssetImage('assets/logo_picture.PNG'),
                    ),
                    StreamBuilder<Object>(
                        stream: null,
                        builder: (context, snapshot) {
                          return const SizedBox(height: 10);
                        }),
                    const SizedBox(height: 5),
                    Text(
                      "       HELLO !  \n  ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      " welcome in our tech app for smart accessory",
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(183, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 250,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(161, 255, 153, 0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              "Get Start",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ))));
  }
}
