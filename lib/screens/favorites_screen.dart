import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Flexible(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Text("Your favorite movies",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
          ),
        ),
        Flexible(
          flex: 7,
          child: ListView(
            children:  [
              Card(
                child: ListTile(
                  tileColor: Colors.black,
                  leading:  Image(image: AssetImage("images/login_BG2.jpg"), fit: BoxFit.cover,height: 100,width: 90,),
                  title: Text('Example Movie', style: TextStyle(color: Colors.white,),),
                  trailing: IconButton(onPressed: (){}, icon: Icon(Icons.cancel_outlined,color: Colors.redAccent,),),
                  subtitle: Text('release date: June 2022', style: TextStyle(color: Colors.white70),),
                  isThreeLine: true,
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
