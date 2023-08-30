import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:popcorn_flix/Networking/request_helper.dart';
import 'package:popcorn_flix/components/reusable_movie_card.dart';
import 'package:popcorn_flix/components/reusable_movie_group.dart';

import '../dataObjects/movieDO.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<MovieDO> movies = <MovieDO>[
    MovieDO(name: "Ex movie 1", image: const AssetImage("images/login_BG.jpg")),
    MovieDO(
        name: "Ex movie 2", image: const AssetImage("images/login_BG2.jpg")),
    MovieDO(name: "Ex movie 3", image: const AssetImage("images/login_BG3.jpg")),
    MovieDO(name: "Ex movie 3", image: const AssetImage("images/login_BG3.jpg")),
    MovieDO(name: "Ex movie 3", image: const AssetImage("images/login_BG3.jpg")),
    MovieDO(name: "Ex movie 3", image: const AssetImage("images/login_BG3.jpg")),
    MovieDO(name: "Ex movie 3", image: const AssetImage("images/login_BG3.jpg")),
    MovieDO(name: "Ex movie 3", image: const AssetImage("images/login_BG3.jpg")),
    MovieDO(name: "Ex movie 3", image: const AssetImage("images/login_BG3.jpg")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child:
                Image.asset("images/netflix_logo2.png", width: 150, height: 30),
          )),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReusableMovieGroup(categoryName: "Example Category", movies: movies),
            ReusableMovieGroup(categoryName: "Example Category 2", movies: movies),
            ReusableMovieGroup(categoryName: "Example Category 3", movies: movies),
            ReusableMovieGroup(categoryName: "Example Category 4", movies: movies),
          ],
        ),
      ),
    );
  }
}
