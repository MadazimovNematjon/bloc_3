// States
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../model/post.dart';

@immutable
abstract class CreatePostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreatePostInitial extends CreatePostState {

}

class CreatePostLoading extends CreatePostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class CreatePostError extends CreatePostState {
  final String errorMessage;

  CreatePostError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class CreatedPostState extends  CreatePostState{
   final Post post;
   CreatedPostState(this.post);

   @override
   // TODO: implement props
   List<Object?> get props => [post];
}