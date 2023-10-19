import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:popcorn_flix/screens/home_screen.dart';

import '../Networking/request_helper.dart';
import '../dataObjects/movieDO1.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  /*-----Lifecycle methods for a stateful widget------
  * 1. initState() -> gets called first when the widget is created and added into the widget tree.
  * 2. build() -> gets called everytime when our stateful widget gets built or rebuilt(via state method)
  * 3. deactivate() -> gets called everytime when our stateful widget gets popped off the widget tree.
  * */
  var categoryMovies = {
    "top_boxoffice_200": <MovieDO1>[],
    "top_rated_series_250":<MovieDO1>[],
    "upcoming_movies":<MovieDO1>[]
  };
  @override
  void initState() {
    super.initState();
    getMovieData();
  }
  List<MovieDO1> extractMovies(dynamic data){
    print("RESULTS");
    print(data);
    List<MovieDO1> movies = [];
    for(var i in data){
      print(i);
      if(i["primaryImage"] != null && i["plot"] != null){
        MovieDO1 m = MovieDO1();
        m.fromJson(i);

        movies.add(m);
      }


    }
    return movies;
  }
  void addMoviesData(dynamic value, String key){
    var m = value["results"];
    categoryMovies[key] = extractMovies(m);
  }

  void checkData(){
    bool isLoaded = true;
    categoryMovies.forEach((key, value) {
      if(categoryMovies[key] == []){
        isLoaded = false;
      }
    });
    if(isLoaded){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context){return HomeScreen(netMovies:categoryMovies);}),
              (route) => false
      );
    }
  }


  void getMovieData(){
    try{
      categoryMovies.forEach((key, value) async {
        RequestHelper requestHelper = RequestHelper();
        if(key == "upcoming_movies"){
          await requestHelper.getUpcomingMovies().then((value){
            addMoviesData(value, key);
            checkData();
          });
        }else{
          await requestHelper.getCategoryMovies(key).then((value){
            addMoviesData(value, key);
            checkData();
          });
        }
      });
      print('Data--------------------------------->$categoryMovies');


    }catch(e){

      print("error loading movies///////////////////////////////$e");
      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
      //   return LocationScreen(locationScreenData: null);
      // }), (route) => false);

    }

  }


  @override
  Widget build(BuildContext context) {
    const spinkit2 = SpinKitFadingFour(
      color: Colors.redAccent,
      size: 60,
    );
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: spinkit2),
    );
  }
}