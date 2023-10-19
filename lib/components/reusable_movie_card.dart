

import 'package:flutter/material.dart';
import 'package:popcorn_flix/Networking/fire_store.dart';
import 'package:popcorn_flix/screens/movie_screen.dart';


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
    return Padding(
      padding: EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){return MovieScreen(movie: widget.movieDO); }));
          },
          onLongPress: (){
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 130,
                  color: Colors.black,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextButton(
                          child: const Text('Add to favorites', style: TextStyle(color: Colors.redAccent,),),
                          onPressed: (){
                            FireStoreDB().addFavorite(widget.movieDO).then((value) {
                              const snackBar = SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text('Added to Favorites', style: TextStyle(color: Colors.blueGrey),),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Container(
            width: 130,
            height: 200,
            child: widget.movieDO.networkImage??Image.network(
              widget.movieDO.posterUrl,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){
                if (loadingProgress == null) {
                  return child;
                }
                if(loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes){
                  widget.movieDO.addNetworkImage(context.widget);
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
      ),
    );
  }
}
