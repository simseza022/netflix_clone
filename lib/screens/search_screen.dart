import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Icon(Icons.search, color: Colors.white,),
              hintText: "Search...",
              hintStyle: MaterialStateProperty.resolveWith((states)=>const TextStyle(color: Colors.white38)),
            );
          }, suggestionsBuilder: (BuildContext context, SearchController controller) { return <ListTile>[]; },),
    );
        // suggestionsBuilder: suggestionsBuilder);
  }
}
