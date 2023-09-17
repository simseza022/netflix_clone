import 'package:flutter/material.dart';

import '../components/reusable_movie_card.dart';
import '../dataObjects/movieDO.dart';
import '../dataObjects/movieDO1.dart';

class CategoryScreen extends StatefulWidget {
  final List<MovieDO1> movies;
  const CategoryScreen({super.key, required this.movies});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text("Movies", style: TextStyle(color: Colors.red),),
            ),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: List.generate(widget.movies.length, (index) {
                  return ReusableMovieCard(
                    movieDO: widget.movies[index],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
