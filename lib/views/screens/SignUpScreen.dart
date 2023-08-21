import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/views/screens/Homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Homescreen.dart';

class SignUpScreen extends StatefulWidget {
  final Function() OnClickedSignIn;
  const SignUpScreen({
    Key? key,
    required this.OnClickedSignIn,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool passVisiple = true;

  //navigator
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WELCOME  ...."),
          backgroundColor: Color.fromARGB(161, 255, 153, 0),
        ),
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
                Padding(
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
                ),
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
                      try {
                        var user = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailcontroller.text.trim(),
                                password: passwordcontroller.text.trim());
                      } catch (e) {
                        print(e);
                      }
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

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("SignUp Succes"),
                        ),
                      );
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
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                    text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  text: ' Already Have An account?',
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.OnClickedSignIn,
                      text: 'SignIn',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ));

    /*Future SignUp() async {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(child: CircularProgressIndicator()));

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailcontroller.text.trim(),
            password: passwordcontroller.text.trim());
      } on FirebaseAuthException catch (e) {
        print(e);
      }
      // navigatorKey.currentState!.popUntil((route)=>route);
    }*/
  }
}
