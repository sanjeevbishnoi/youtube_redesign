import '../../components/search/videoheader.dart';
import 'package:flutter/material.dart';

class VideoList extends StatelessWidget {
  final VideoHeader videoHeader;
  const VideoList({
    Key key,
    @required this.links,
    @required this.videoHeader
  }) : super(key: key);

  final List<String> links;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemCount: 10,
    separatorBuilder: (BuildContext context,int index){
      return Divider();
    },
    itemBuilder: (BuildContext context,int index){
      if(index==0){
        return this.videoHeader;
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
    );
  }
}

