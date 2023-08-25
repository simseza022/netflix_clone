

import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Add TextFormFields and ElevatedButton here.
          // Image(image: AssetImage('images/Netflix_icon.png')),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Image.asset(
              "images/Netflix_logo.png",
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
                hintText: "Email or Phone number",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.password_sharp,
                  color: Colors.redAccent,
                ),
                contentPadding: const EdgeInsets.all(7),
                hintText: "Password",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.password,
                  color: Colors.redAccent,
                ),
                contentPadding: const EdgeInsets.all(7),
                hintText: "Confirm Password",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all<Color>(Colors.red),
                    elevation:MaterialStateProperty.all<double>(20),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                      side: BorderSide(color: Colors.red)
                  )
                )),
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
                fillColor: MaterialStateProperty.resolveWith((c){return Colors.red;}),
                value: false, onChanged: (bool? value) {  },
              ),
              const Text("Remember my login?", style: TextStyle(color: Colors.white70),),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already on Netflix?", style: TextStyle(color: Colors.white70),),
              TextButton(onPressed: (){}, child: const Text("Sign in",style: TextStyle(color: Colors.red),))
            ],
          )
        ],
      ),
    );
  }
}
