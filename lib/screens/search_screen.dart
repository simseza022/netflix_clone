import 'package:flutter/material.dart';
import 'package:popcorn_flix/Networking/request_helper.dart';
import 'package:popcorn_flix/dataObjects/movieDO.dart';

import '../components/reusable_movie_card_detailed.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isDark = false;
  List<MovieDO> movies = [];
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: SearchAnchor(
              headerTextStyle: const TextStyle(color: Colors.white),
              isFullScreen: false,
              viewBackgroundColor: Colors.black,
                builder: (BuildContext context, SearchController controller) {
                  return SearchBar(
                    textStyle: MaterialStateProperty.resolveWith((states)=>const TextStyle(color: Colors.white)),
                    backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white10),
                    controller: controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    onTap: () {
                      // controller.openView();
                    },
                    onChanged: (_) {
                      // controller.openView();
                    },
                    onSubmitted: (value){
                      RequestHelper().searchMovies(value).then((v){
                        setState(() {
                          movies = extractMovies(v['results']);
                        });
                      });
                    },
                    leading: const Icon(Icons.search, color: Colors.white,),
                    hintText: "Search...",
                    hintStyle: MaterialStateProperty.resolveWith((states)=>const TextStyle(color: Colors.white38)),
                  );
                }, suggestionsBuilder: (BuildContext context, SearchController controller) { return <ListTile>[]; },),
          ),
          Expanded(
            flex: 8,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(5),
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieCardDetailed(movie: movies[index]);
              }),)
        ],
      ),
    );
        // suggestionsBuilder: suggestionsBuilder);
  }
  List<MovieDO> extractMovies(dynamic data){
    print("RESULTS");
    print(data);
    List<MovieDO> movies = [];
    for(var i in data){
      print(i);
      if(i["primaryImage"] != null && i["plot"] != null){
        MovieDO m = MovieDO();
        m.fromJson(i);


        movies.add(m);
      }


    }
    return movies;
  }
}
