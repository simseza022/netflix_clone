import 'package:flutter/material.dart';
import 'package:popcorn_flix/Forms/signIn_form.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/login_BG.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 330,
              height: 570,
              decoration:  const BoxDecoration(
                color: Color.fromARGB(110, 0, 0, 0),
                borderRadius: BorderRadius.all(Radius.circular(20)),

              ),
              child: SignInForm(),
            ),
          ),
        ),
      ),
    );
  }
}
