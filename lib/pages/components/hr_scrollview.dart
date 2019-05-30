import 'package:flutter/material.dart';

import '../../models/home_post.dart';
import './article_card.dart';
class HRScrollView extends StatefulWidget {
  final List<PostDatum> post;
  HRScrollView(this.post):super(); 

  @override
  _HRScrollViewState createState() => new _HRScrollViewState();
}

class _HRScrollViewState extends State<HRScrollView> {
  
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return  cartBuilder();
  }

  cartBuilder() {

    print("widget.post.length ${widget.post.length}");
    // print(pages);
    if (widget.post.length == 0) {
      return new Container(
        height: 180.00,
        color: Colors.white,
        child: new Center(
          child: new Text(
            'No post found',
          ),
        ),
      );
    } else {
      return new Container(
        height: 180.00,
        color: Colors.white,
        child: new ListView.separated(
          itemCount: widget.post.length,
          separatorBuilder: (context, index) => SizedBox(
        width: 10.00,
      ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>  ArticleCard(widget.post[index]),
      ),
        
      );
    }
  }
}