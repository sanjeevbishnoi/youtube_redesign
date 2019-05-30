import 'package:flutter/material.dart';
import '../../components/search/search_bar.dart';

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
        body: 
        
        ListView.separated(itemCount: 10,
        separatorBuilder: (BuildContext context,int index){
          return Divider();
        },
        itemBuilder: (BuildContext context,int index){
          if(index==0){
            return ListTile(
              isThreeLine: true,
              title: Text(
                'Recommendations',
                style: TextStyle(fontSize: 16.00, fontWeight: FontWeight.w600),
                
              ),
              subtitle: Text(
                'If user has search history then recommend videos of similar interest, showing empty page is not a postive thing',
                style: TextStyle(fontSize: 14.00, fontWeight: FontWeight.w400),
              ),
              );
          }
          return ListTile(
          leading: Image.network(
            "http://img.youtube.com/vi/" + links[index] + "/0.jpg",
            width: 100.00,
            height: 100.00,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "$index/$index/2019".toUpperCase(),
                style: TextStyle(
                    fontSize: 12.00,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
              Text(
                'Dummmy Video $index',
                style: TextStyle(fontSize: 16.00, fontWeight: FontWeight.w600),
              )
            ],
          ),
          subtitle: Text('Sanjeev Bishnoi',
              style: TextStyle(fontSize: 14.00, fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.more_vert),
        );
        },
        )
      );
  }
}
