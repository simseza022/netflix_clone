import 'package:flutter/material.dart';
import 'package:popcorn_flix/screens/movie_screen.dart';

import '../dataObjects/movieDO1.dart';

class MovieCardDetailed extends StatefulWidget {
  final MovieDO1 movie;
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
                    child: widget.movie.networkImage ?? Image.network(
                      widget.movie.posterUrl,
                      height: 150,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.redAccent,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },

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
