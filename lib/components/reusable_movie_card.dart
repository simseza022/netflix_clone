

import 'package:flutter/material.dart';
import 'package:popcorn_flix/Networking/fire_store.dart';
import 'package:popcorn_flix/screens/movie_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../dataObjects/movieDO.dart';


class ReusableMovieCard extends StatefulWidget {
  final MovieDO movieDO;
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
            child: CachedNetworkImage(
              imageUrl: widget.movieDO.posterUrl,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress, color: Colors.redAccent, )),
              errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.redAccent,),

            ),
          ),
        ),
      ),
    );
  }
}
