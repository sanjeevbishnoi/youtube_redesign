// To parse this JSON data, do
//
//     final homePost = homePostFromJson(jsonString);

import 'dart:convert';
import 'package:equatable/equatable.dart';

List<HomePost> homePostFromJson(String str) =>
    new List<HomePost>.from(json.decode(str).map((x) => HomePost.fromMap(x)));

String homePostToJson(List<HomePost> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toMap())));

class HomePost extends Equatable{
  int termId;
  String name;
  String slug;
  String description;
  int count;
  List<PostDatum> postData;

  HomePost({
    this.termId,
    this.name,
    this.slug,
    this.description,
    this.count,
    this.postData,
  }):super([termId,name,slug,description,count,postData]);

  factory HomePost.fromMap(Map<String, dynamic> json) => new HomePost(
        termId: json["term_id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        count: json["count"],
        postData: new List<PostDatum>.from(
            json["postData"].map((x) => PostDatum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "term_id": termId,
        "name": name,
        "slug": slug,
        "description": description,
        "count": count,
        "postData": new List<dynamic>.from(postData.map((x) => x.toMap())),
      };
}

class PostDatum extends Equatable{
  int postId;
  String title;
  String author;
  String postDate;
  String imageUrl;
  String postType;
  dynamic description;
  dynamic link;
  dynamic srtLink;
  

  PostDatum({
    this.postId,
    this.title,
    this.author,
    this.postDate,
    this.imageUrl,
    this.postType,
    this.description,
    this.link,
    this.srtLink,
    
  }):super([postId,title,author,postDate,imageUrl,postType,description,link,srtLink]);

  factory PostDatum.fromMap(Map<String, dynamic> json) => new PostDatum(
        postId: json["post_id"],
        title: json["title"],
        author: json["author"],
        postDate: json["post_date"],
        imageUrl: json["image_url"],
        postType: json["post_type"],
        description: json["description"],
        link: json["link"],
        srtLink: json["srt_link"],
        
      );

  Map<String, dynamic> toMap() => {
        "post_id": postId,
        "title": title,
        "author": author,
        "post_date": postDate,
        "image_url": imageUrl,
        "post_type": postType,
        "description": description,
        "link": link,
        "srt_link": srtLink,
        
      };
}
