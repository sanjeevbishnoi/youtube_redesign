import 'dart:async';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import './bloc.dart';
import '../../models/home_post.dart';



class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final http.Client httpClient;

  HomeBloc({@required this.httpClient});

  @override
  Stream<HomeState> transform(
    Stream<HomeEvent> events,
    Stream<HomeState> Function(HomeEvent event) next,
  ) {
    return super.transform(
      (events as Observable<HomeEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  get initialState => HomeLoading();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is Fetch) {
      try {
        
          final posts =
              await _fetchPosts();
          yield  HomeLoaded(
                  posts: posts,
                );
        
      } catch (e) {
        print(e.message);
        yield HomeError();
      }
    }
  }

  Future<List<HomePost>> _fetchPosts() async {
    final response = await httpClient.get(
        "http://www.codenextgen.com/bishnoinextgen/api/api_v2.php?method=getAllCategoriesWithPosts");
    if (response.statusCode == 200) {
        List<HomePost> list =homePostFromJson(response.body);
        return list;
    } else {

      throw Exception('error fetching posts');
    }
  }
}
