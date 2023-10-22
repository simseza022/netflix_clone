import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_flix/screens/movie_screen.dart';

import '../dataObjects/movieDO.dart';

class MovieCardDetailed extends StatefulWidget {
  final MovieDO movie;
  const MovieCardDetailed({super.key, required this.movie});

  @override
  State<MovieCardDetailed> createState() => _MovieCardDetailedState();
}

class _MovieCardDetailedState extends State<MovieCardDetailed> {

  String getGenresData(dynamic s){
    print(s);
    String genres = "";
    for(int i=0; i<s.length; i++){
      if(i!=s.length-1){
        genres = genres + s[i]['text'] + ", ";
      }else{
        genres = genres + s[i]['text'];
      }
    }
    return genres;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child:  Row(
        children: [
          Expanded(
           flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(

                  borderRadius: BorderRadius.circular(25),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){return MovieScreen(movie: widget.movie); }));
                    },
                    child: CachedNetworkImage(
                      imageUrl: widget.movie.posterUrl,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          Center(child: CircularProgressIndicator(value: downloadProgress.progress, color: Colors.redAccent, )),
                      errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.redAccent,),
                    ),
                  ),
                ),
              )
          ),
          Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(widget.movie.title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                ),
                Text("Rating: ${widget.movie.data['ratingsSummary']['aggregateRating']}/10",
                  style: const TextStyle(color: Colors.white,

                    fontWeight: FontWeight.bold,
                  ),),
                Text(getGenresData(widget.movie.data['genres']['genres']),
                  style:TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.bold
                  ),
                ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Released: ",
                      style: TextStyle(color:Colors.white),
                    ),
                    Text(
                         "${widget.movie.data['releaseYear']['year']}",
                      style: const TextStyle(color:Colors.redAccent),
                    ),
                  ],
                )
            ],
          ),
              )),
        ],
      ),

    );
  }
}
