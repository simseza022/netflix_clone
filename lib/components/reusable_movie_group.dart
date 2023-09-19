import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:popcorn_flix/components/reusable_movie_card.dart';
import '../dataObjects/movieDO1.dart';
import '../screens/category_screen.dart';

class ReusableMovieGroup extends StatefulWidget {
  final String categoryName;
  final List<MovieDO1> movies;
  const ReusableMovieGroup({super.key, required this.categoryName, required this.movies});

  @override
  State<ReusableMovieGroup> createState() => _ReusableMovieGroupState();
}

class _ReusableMovieGroupState extends State<ReusableMovieGroup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.categoryName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.left,
              ),
              TextButton(
                  onPressed: () {
                    // RequestHelper().getMovies();
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>CategoryScreen(movies: widget.movies)));
                  },
                  child: const Text("View All",
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.red)))
            ],
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 260,
            minHeight: 100
          ),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(5),
              itemCount: widget.movies.length,
              itemBuilder: (BuildContext context, int index) {
                return ReusableMovieCard(movieDO: widget.movies[index]);
              }),
        ),
      ],
    );
  }
}
