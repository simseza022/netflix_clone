import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:popcorn_flix/screens/favorites_screen.dart';
import 'package:popcorn_flix/screens/landing_screen.dart';
import 'package:popcorn_flix/screens/profile_screen.dart';
import 'package:popcorn_flix/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  final Map netMovies;
  const HomeScreen({super.key, required this.netMovies});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  Color homeColor = Colors.white24;
  Color searchColor = Colors.white24;
  Color favColor = Colors.white24;
  @override
  Widget build(BuildContext context) {
    List<Widget> routes = <Widget>[
      LandingScreen(netMovies: widget.netMovies),
      const SearchScreen(),
      const FavoritesScreen()
    ];
    return Scaffold(
      appBar: AppBar(
          /**/
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: InkWell(
                splashColor: Colors.white,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                },
                highlightColor: Colors.white,
                child: const CircleAvatar(
                  backgroundColor: Colors.white24,
                  radius: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage("images/profilePic.jpeg"),
                    radius: 14,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          titleSpacing: 0,
          backgroundColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.only(left: 115),
            child: Image.asset("images/popFlix.png", width: 130 , height: 190),
          )),
      backgroundColor: Colors.black,
      body: routes.elementAt(_currentPage),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        color: Colors.black,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.vertical,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      tooltip: "Home PAge",
                      icon: Icon(
                        Icons.home_filled,
                        color: homeColor,
                      ),
                      onPressed: () {
                        setState(() {
                          homeColor = Colors.red;
                          favColor = Colors.white24;
                          searchColor = Colors.white24;
                          _currentPage = 0;
                        });
                      },
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: homeColor),
                    )
                  ]),
              Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.vertical,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      tooltip: "Search",
                      icon: Icon(
                        Icons.search_outlined,
                        color: searchColor,
                      ),
                      onPressed: () {
                        setState(() {
                          searchColor = Colors.red;
                          homeColor = Colors.white24;
                          favColor = Colors.white24;
                          _currentPage = 1;
                        });
                      },
                    ),
                    Text(
                      "Search",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: searchColor),
                    )
                  ]),
              Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.vertical,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      tooltip: "Favorites",
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: favColor,
                      ),
                      onPressed: () {
                        setState(() {
                          favColor = Colors.red;
                          homeColor = Colors.white24;
                          searchColor = Colors.white24;
                          _currentPage = 2;
                        });
                      },
                    ),
                    Text(
                      "Favorites",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: favColor),
                    )
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
