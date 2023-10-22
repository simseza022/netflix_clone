import 'package:flutter/material.dart';

import '../components/reusable_movie_group.dart';

class LandingScreen extends StatefulWidget {
  final Map netMovies;
  const LandingScreen({super.key, required this.netMovies});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  SingleChildScrollView(
        child: Column(
          children: [
            ReusableMovieGroup(categoryName: "Top Rated Series", movies: widget.netMovies["most_pop_series"]),
            ReusableMovieGroup(categoryName: "Upcoming Movies", movies: widget.netMovies["top_rated_series_250"]),
            ReusableMovieGroup(categoryName: "Top Rated Movies", movies: widget.netMovies["top_boxoffice_200"]),


          ],
        ),
      ),
    );
  }
}
