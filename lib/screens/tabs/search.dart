import 'package:flutter/material.dart';
import '../../components/search/search_bar.dart';
import '../../components/search/videolist.dart';
import '../../components/search/videoheader.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

List<String> links=["iMEhjsiHbwM","vZPOiMzUBCE","aJOTlE1K90k","pRpeEdMmmQ0","GXoErccq0vw","iMEhjsiHbwM","vZPOiMzUBCE","aJOTlE1K90k","pRpeEdMmmQ0","GXoErccq0vw"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          iconTheme: IconThemeData(color: Colors.white),
          title: SearchBar(),
        ),
        body:  new VideoList(videoHeader:VideoHeader(title: "Recommendations",subtitle: "If nothing in search query show history(recommendations based upon history) not empty pagefor positive impact",),links: links)
      );
  }
}

