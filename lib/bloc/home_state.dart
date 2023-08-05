import 'package:equatable/equatable.dart';

import '../model/post.dart';

abstract class HomeState extends  Equatable{

  @override
  List<Object> get props => [];
}


class HomeInit extends HomeState{

}

class HomeLoaded extends HomeState{
  final List<Post>? posts;

  HomeLoaded({this.posts});

}
class HomeLoading extends HomeState{

  @override
  // TODO: implement props
  List<Object> get props => [];

}

class HomeError extends HomeState{
  final String? error;
  HomeError({this.error});
}

class HomePostListState extends HomeState{
   List<Post> posts = [];
  HomePostListState(this.posts);

  @override
  // TODO: implement props
  List<Object> get props => [posts];
}