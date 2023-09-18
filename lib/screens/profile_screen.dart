import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              children: const [
                Card(
                  child: ListTile(
                    tileColor: Colors.black,
                    leading: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.person, size: 30, color: Color.fromRGBO(189, 132, 132,1),),
                    ),
                    title: Text('Name', style: TextStyle(color: Colors.white24),),
                    subtitle:
                    Text('Sisonke Msezane', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.edit, color: Color.fromRGBO(189, 132, 132,1), size: 25,),//
                    isThreeLine: true,
                  ),
                ),
                Card(
                  child: ListTile(
                    tileColor: Colors.black,
                    leading: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.email_outlined, size: 30, color: Color.fromRGBO(189, 132, 132,1),),
                    ),
                    title: Text('Email Address', style: TextStyle(color: Colors.white24),),
                    subtitle:
                    Text('sisonkemondli@gmai.com', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.edit, color: Color.fromRGBO(189, 132, 132,1), size: 25,),//
                    isThreeLine: true,
                  ),
                ),
                Card(
                  child: ListTile(
                    tileColor: Colors.black,
                    leading: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.phone, size: 30, color: Color.fromRGBO(189, 132, 132,1),),
                    ),
                    title: Text('Phone Number', style: TextStyle(color: Colors.white24),),
                    subtitle:
                    Text('+2723456789', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.edit, color: Color.fromRGBO(189, 132, 132,1), size: 25,),//
                    isThreeLine: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
