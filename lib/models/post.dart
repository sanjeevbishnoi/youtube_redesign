import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String body;
  final String imageUrl;
  final String post_type;
  final String link;

  Post({this.id, this.title, this.body,this.imageUrl,this.post_type,this.link}) : super([id, title, body,imageUrl,post_type,link]);

  @override
  String toString() => 'Post { id: $id }';
}