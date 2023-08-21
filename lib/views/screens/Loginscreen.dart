import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/views/screens/Homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatefulWidget {
  final VoidCallback onClickSignUp;

  const Loginscreen({
    Key? key,
    required this.onClickSignUp,
  }) : super(key: key);

  @override
  State<Loginscreen> createState() => LoginscreenState();
}

class LoginscreenState extends State<Loginscreen> {
// 1-creat aform with GlobalKey
  final _formKey = GlobalKey<FormState>();
  bool passVisiple = true;

  //navigator
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Smart Accessories ...."),
          backgroundColor: Color.fromARGB(161, 255, 153, 0),
        ),

        //2- Build a Form widget using the _formKey created above.

        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    height: 200,
                    width: 200,
                    image: AssetImage('assets/Image.PNG'),
                  ),
                  StreamBuilder<Object>(
                      stream: null,
                      builder: (context, snapshot) {
                        return const SizedBox(height: 10);
                      }),
                  /* Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        validator: (value) {
                          // 3-Number validation
                          if (value == null ||
                              value.isEmpty ||
                              value.length != 11) {
                            return 'Please enter The correct Number';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.phone_android),
                          labelText: 'phone number',
                        )),
                  ),*/
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: emailcontroller,
                        validator: (value) {
                          // 3-email validation
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8 ||
                              value.contains('@') == false) {
                            return 'Please enter Valid email';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'Email',
                        )),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: passwordcontroller,
                        obscureText: passVisiple,
                        validator: (value) {
                          // 3-password validation
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return 'Please enter Valid password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passVisiple = !passVisiple;
                              });
                            },
                            icon: Icon(
                              passVisiple
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          icon: Icon(Icons.password),
                          labelText: 'password',
                        )),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () async {
                      //3-validation all number&password&email
                      if (_formKey.currentState!.validate()) {
                        bool result = await fireBaseLogin(
                            emailcontroller.text, passwordcontroller.text);
                        if (result == true) {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          await prefs.setString('email', emailcontroller.text);
                          //navigator poshing
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homescreen(
                                      email: emailcontroller.text,
                                    )),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Login Faild"),
                            ),
                          );
                        }
                      }
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
                            "Log In",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /* CupertinoButton.filled(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("success"),
                          ),
                        );
                      }
                    },
                    child: const Text('Log In'),
                  ),
                  */
                  const CupertinoButton(
                    onPressed: null,
                    child: Text('Forgot password? No yawa.Tap me'),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                      text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    text: ' Have No account?',
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickSignUp,
                        text: 'SignUp',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ],
                  ))
                ],
              ),
            )));
  }

  Future<bool> fireBaseLogin(String email, String password) async {
    try {
      // FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No User Found For That Email');
      } else if (e.code == 'wrong-password') {
        print('Wrong Password Provided For That User ');
      }
    }
    return false;
  }
}
