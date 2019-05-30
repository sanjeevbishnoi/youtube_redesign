import 'package:flutter/material.dart';
import '../../models/home_post.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArticleCard extends StatelessWidget {
  final PostDatum article;
  ArticleCard(this.article) : super();
  @override
  Widget build(BuildContext context) {
    String imageUrl = article.imageUrl;
    if (imageUrl == null || imageUrl.length == 0) {
      imageUrl =
          "http://static.dnaindia.com/locality/sites/default/files/styles/news_slider/public/newsimage/unnamed_22.png?itok=xrwdIZME";
    }

    return Hero(
      tag: this.article.postId,
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => AnimalDetail(product: this.animal)),
          // );
        },
        child: Container(
            width: 180.00,
            height: 180.00,
            color: Colors.white10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                    child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => new Icon(Icons.image),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                )),
                titleView(article.title, article.postType, context),
                priceView(article.postDate, '', context)
              ],
            )),
      ),
    );
  }

  Widget titleView(String heading, String distance, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child:Text(
            heading,
            maxLines: 1,
            style: TextStyle(
                fontFamily: 'google',
                fontSize: 14.00,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w600),
          )),
          
        ],
      ),
    );
  }

  Widget priceView(String heading, String distance, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            heading,
            style: TextStyle(
                fontFamily: 'google',
                fontSize: 14.00,
                color: Colors.grey,
                fontWeight: FontWeight.w400),
          ),
          Text(
            distance,
            style: TextStyle(
                fontFamily: 'google',
                fontSize: 16.00,
                color: Colors.orange,
                fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }
}
