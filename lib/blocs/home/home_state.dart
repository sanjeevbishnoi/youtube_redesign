import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../models/post.dart';
import '../../models/home_post.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([List props = const []]) : super(props);
}

class HomeLoading extends HomeState {
  @override
  String toString() => 'HomeLoading';
}

class HomeError extends HomeState {
  @override
  String toString() => 'HomeError';
}

class HomeLoaded extends HomeState {
  final List<HomePost> posts;

  HomeLoaded({
    this.posts,
    
  }) : super([posts]);

  HomeLoaded copyWith({
    List<HomePost> posts
  }) {
    return HomeLoaded(
      posts: posts ?? this.posts
    );
  }

  @override
  String toString() =>
      'PostLoaded { posts: ${posts.length} }';
}

class InitialPostState extends HomeState {}
