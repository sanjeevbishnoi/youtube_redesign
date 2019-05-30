import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../blocs/post/bloc.dart';
import '../../models/post.dart';
import '../detail_page.dart';
import '../../models/lesson.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final PostBloc _postBloc = PostBloc(httpClient: http.Client());
  final _scrollThreshold = 200.0;

  _HomePageState() {
    _scrollController.addListener(_onScroll);
    _postBloc.dispatch(Fetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _postBloc,
      builder: (BuildContext context, PostState state) {
        if (state is PostUninitialized) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PostError) {
          return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                Text('failed to fetch posts'),
                InkWell(
                    onTap: () {
                      _postBloc.dispatch(Fetch());
                    },
                    child: Padding(
                        padding: EdgeInsets.all(8.00),
                        child: Text(
                          "Retry",
                          style: TextStyle(
                              fontSize: 16.00, fontWeight: FontWeight.bold),
                        )))
              ]));
        }
        if (state is PostLoaded) {
          if (state.posts.isEmpty) {
            return Center(
              child: Text('no posts'),
            );
          }
          return Padding(
              padding: EdgeInsets.all(0.00),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.posts.length
                      ? BottomLoader()
                      : PostWidget(index: index, post: state.posts[index]);
                },
                itemCount: state.hasReachedMax
                    ? state.posts.length
                    : state.posts.length + 1,
                controller: _scrollController,
              ));
        }
      },
    );
  }

  @override
  void dispose() {
    _postBloc.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _postBloc.dispatch(Fetch());
    }
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final Post post;
  final int index;

  const PostWidget({Key key, @required this.index, @required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (post.post_type == 'youtube') {
      return VideoPost(post: post);
    }
    return Container(
      width: 0.0,
      height: 0.0,
    );
    //return new SimplePost(post: post);
  }
}

class SimplePost extends StatelessWidget {
  const SimplePost({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return  Container(
            decoration: BoxDecoration(color: Colors.white),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                            lesson: Lesson(
                                title: "Introduction to Driving",
                                level: "Beginner",
                                indicatorValue: 0.33,
                                price: 20,
                                content:
                                    "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."))));
              },
              title: Text(
                post.title,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16.00,
                    fontFamily: "roboto"),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(post.body,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w300,
                      fontSize: 12.00,
                      fontFamily: "roboto")),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.black,
              ),
            ));
  }
}

class VideoPost extends StatelessWidget {
  const VideoPost({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
   String imageUrl="http://img.youtube.com/vi/" + post.link + "/0.jpg";
    
    return  Container(
            decoration: BoxDecoration(color: Colors.white),
            child: GestureDetector(
                onTap: () {},
                child: Column(children: <Widget>[
                  
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180.00,
                          child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      )),
                    
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Icon(
                            Icons.account_circle,
                            size: 40.0,
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Text(
                                  post.title,
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                              Text(
                                "Sanjeev Bishnoi",
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          flex: 9,
                        ),
                        Expanded(
                          child: Icon(Icons.more_vert),
                          flex: 1,
                        ),
                      ],
                    ),
                  )
                ]))   );
  }
}
