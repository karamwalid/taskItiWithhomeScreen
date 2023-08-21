import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/views/screens/Loginscreen.dart';
import 'package:flutter_application_1/views/screens/SignUpScreen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? Loginscreen(onClickSignUp: toggle)
      : SignUpScreen(OnClickedSignIn: toggle);
  void toggle() => setState(() => isLogin = !isLogin);
}
