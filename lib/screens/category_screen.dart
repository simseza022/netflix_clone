import 'package:flutter/material.dart';
import 'package:popcorn_flix/components/reusable_movie_card_detailed.dart';

import '../components/reusable_movie_card.dart';
import '../dataObjects/movieDO.dart';

class CategoryScreen extends StatefulWidget {
  final List<MovieDO> movies;
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(width: 1.5, color: Colors.white24),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CircleAvatar(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.0),
                        radius: 22,
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 95),
                      child: const Text("Movies",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(5),
                  itemCount: widget.movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieCardDetailed(movie: widget.movies[index]);
                  }),

            ),
          ],
        ),
      ),
    );
  }
}
