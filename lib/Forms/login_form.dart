import 'package:flutter/material.dart';
import 'package:popcorn_flix/screens/loading_screen.dart';

import '../screens/home_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool shouldRememberLogin = false;
  String? validateEmail(String ?value){
    RegExp exp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,10}$');
    // ^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$
    if (value == null || value.isEmpty) {
      return "Enter email address";
    }
    else if(!exp.hasMatch(value)){
      return "Invalid email address";
    }
    return null;
  }
  String? validatePassword(String ?value){
    if (value == null || value.isEmpty) {
      return 'Enter password';
    }
    else if(confirmPasswordController.value.text != passwordController.value.text){
      return "Passwords do not match";
    }
    return null;
  }
  String? validateConfPassword(String ?value){
    if (value == null || value.isEmpty) {
      return 'Enter password';
    }
    else if(confirmPasswordController.value.text != passwordController.value.text){
      return "Passwords do not match";
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            // Add TextFormFields and ElevatedButton here.
            // Image(image: AssetImage('images/Netflix_icon.png')),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Image.asset(
                "images/popFlixP.png",
                width: 110,
                height: 110,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.redAccent,
                  ),
                  contentPadding: const EdgeInsets.all(7),
                  hintText: "Email address",
                  errorStyle: const TextStyle(color: Colors.redAccent),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                validator: validateEmail,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.password_sharp,
                    color: Colors.redAccent,
                  ),
                  contentPadding: const EdgeInsets.all(7),
                  hintText: "Password",
                  filled: true,
                  errorStyle: const TextStyle(color: Colors.redAccent),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                controller: passwordController,
                validator: validatePassword,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.redAccent,
                  ),
                  contentPadding: const EdgeInsets.all(7),
                  hintText: "Confirm Password",
                  filled: true,
                  fillColor: Colors.white,
                  errorStyle: const TextStyle(color: Colors.redAccent),
                  // errorText: ,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                controller: confirmPasswordController,
                onChanged: (value){formKey.currentState!.validate();},
                validator: validateConfPassword,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              child: ElevatedButton(
                  onPressed: () {
                   if(formKey.currentState!.validate()){
                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>  LoadingScreen()), (route) => false);
                   }
                  },
                  style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all<Color>(Colors.red),
                      elevation: MaterialStateProperty.all<double>(20),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: const BorderSide(color: Colors.red)))),
                  child: const Center(
                      child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white),
                  ))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith((c) {
                    return Colors.red;
                  }),
                  value:shouldRememberLogin,
                  onChanged: (bool? value) {
                    setState(() {
                      shouldRememberLogin = value!;
                    });
                  },
                ),
                const Text(
                  "Remember my login?",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already on Netflix?",
                  style: TextStyle(color: Colors.white70),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign in",
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
