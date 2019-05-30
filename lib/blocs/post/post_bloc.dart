import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import './bloc.dart';
import '../../models/post.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;

  PostBloc({@required this.httpClient});

  @override
  Stream<PostState> transform(
    Stream<PostEvent> events,
    Stream<PostState> Function(PostEvent event) next,
  ) {
    return super.transform(
      (events as Observable<PostEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostUninitialized) {
          final posts = await _fetchPosts(1, 20);
          yield PostLoaded(posts: posts, hasReachedMax: false);
          return;
        }
        if (currentState is PostLoaded) {
          int paged=  (((currentState as PostLoaded).posts.length)~/20).toInt();
          
          final posts =
              await _fetchPosts(paged+1, 20);
          yield posts.isEmpty
              ? (currentState as PostLoaded).copyWith(hasReachedMax: true)
              : PostLoaded(
                  posts: (currentState as PostLoaded).posts + posts,
                  hasReachedMax: false,
                );
        }
      } catch (_) {
        yield PostError();
      }
    }
  }

  bool _hasReachedMax(PostState state) =>
      state is PostLoaded && state.hasReachedMax;

  Future<List<Post>> _fetchPosts(int startIndex, int limit) async {
    
    
    final response = await httpClient.get(
        "http://www.codenextgen.com/bishnoinextgen/api/yt_videos.json");
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawPost) {
        return Post(
          id: rawPost['post_id'],
          title: rawPost['title'],
          body: rawPost['post_date'],
          imageUrl: rawPost['image_url'],
          link:rawPost['link'],
          post_type:rawPost['post_type']
        );
      }).toList();
    } else {
      print("comes here");
      throw Exception("error fetching posts ${response.statusCode}");
    }
  }
}
