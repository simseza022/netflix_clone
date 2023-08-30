import 'package:flutter/material.dart';
import 'package:popcorn_flix/dataObjects/movieDO.dart';

import '../screens/movie_screen.dart';

class ReusableMovieCard extends StatefulWidget {
  final MovieDO movieDO;
  const ReusableMovieCard({super.key, required this.movieDO});

  @override
  State<ReusableMovieCard> createState() => _ReusableMovieCardState();
}

class _ReusableMovieCardState extends State<ReusableMovieCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 190,

      child: Column(
        children: [
          Container(
            width: 120,
            height: 150,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: widget.movieDO.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            widget.movieDO.name,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.white54,),
          ),
        ],
      ),
    );
  }
}
