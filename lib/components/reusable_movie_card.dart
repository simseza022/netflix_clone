import 'package:flutter/material.dart';


import '../dataObjects/movieDO1.dart';


class ReusableMovieCard extends StatefulWidget {
  final MovieDO1 movieDO;
  const ReusableMovieCard({super.key, required this.movieDO});

  @override
  State<ReusableMovieCard> createState() => _ReusableMovieCardState();
}

class _ReusableMovieCardState extends State<ReusableMovieCard> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(

      constraints: const BoxConstraints(
        maxHeight: 260,
        maxWidth: 140,
        minHeight: 100,
        minWidth: 140
      ),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 140,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // image: DecorationImage(
              //   image: Image.network('https://picsum.photos/250?image=9'),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: FadeInImage.assetNetwork(placeholder: 'images/loading.gif', image: widget.movieDO.posterUrl, fit: BoxFit.cover,),
          ),
          SizedBox(
            width: 100,
            child: Text(
                widget.movieDO.title,
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.white54,),
                softWrap:true
            ),
          ),
        ],

      ),
    );
  }
}
