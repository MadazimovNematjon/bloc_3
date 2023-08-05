// Events
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../model/post.dart';

@immutable
abstract class CreateEvent extends Equatable {
  const CreateEvent();
}

class CreatePostEvent extends CreateEvent{
  final Post post;
  const CreatePostEvent(this.post);
  @override
  // TODO: implement props
  List<Object?> get props => [post];
}
