import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:popcorn_flix/dataObjects/movieDO.dart';

class FireStoreDB{
  Future<void>  addFavorite(MovieDO movie) async {
    var user = FirebaseAuth.instance;
    var db = FirebaseFirestore.instance;

    var data = {
      "uid": user.currentUser?.uid,
      "movieId": movie.id.toString(),
      "movieTitle": movie.title,
      "posterUrl":movie.posterUrl
    };
    await db.collection("favorites").add(data);
  }
}