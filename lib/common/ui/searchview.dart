import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return 
      Container(
        margin: EdgeInsets.all(16.00),
      child:
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.settings),
              border: OutlineInputBorder(),
              hintText: "Search Here" ,
              contentPadding: EdgeInsets.all(14.00)
              )),
    );
  }
}
