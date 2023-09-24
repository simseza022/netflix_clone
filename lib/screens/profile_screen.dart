import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_flix/Networking/authentification.dart';
import 'package:popcorn_flix/screens/signIn_screen.dart';
import 'package:popcorn_flix/screens/signup_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  var userEnmail =  FirebaseAuth.instance.currentUser?.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 11, 10,0),
      appBar: AppBar(
        backgroundColor:Colors.black ,
        title: const Text("Profile", style: TextStyle(color: Colors.redAccent),),
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back,
            color: Colors.redAccent,
          ),
          onPressed: () { Navigator.pop(context); },
          color: Colors.black,

        ),

      ),
      body:Column(
        children: [
           Flexible(
            flex: 3,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage:AssetImage("images/profilePic.jpeg"),
                radius: 80,
                // child: Icon(Icons.person_2_rounded, size: 70, color: Color.fromRGBO(189, 132, 132,1),),
              ),
            ),
          ),
          Flexible(
            flex: 7,
            child: ListView(
              children:  [
                 Card(
                  child: ListTile(
                    tileColor: Colors.black,
                    leading: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.email_outlined, size: 30, color: Color.fromRGBO(189, 132, 132,1),),
                    ),
                    title: Text('Email Address', style: TextStyle(color: Colors.white24),),
                    subtitle:
                    Text(userEnmail==null?'sisonkemondli@gmail.com':userEnmail!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.edit, color: Color.fromRGBO(189, 132, 132,1), size: 25,),//
                    isThreeLine: true,
                  ),
                ),
                const Card(
                  child: ListTile(
                    tileColor: Colors.black,
                    leading: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.password_rounded, size: 30, color: Color.fromRGBO(189, 132, 132,1),),
                    ),
                    title: Text('Password', style: TextStyle(color: Colors.white24),),
                    subtitle:
                    Text('*********', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.edit, color: Color.fromRGBO(189, 132, 132,1), size: 25,),//
                    isThreeLine: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  child: ElevatedButton(
                      onPressed: () {
                        Auth().signOutUser().then((value){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>  const SignInScreen()), (route) => false);
                        });
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
                            "Log Out",
                            style: TextStyle(color: Colors.white),
                          ))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
