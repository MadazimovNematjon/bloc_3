import 'package:bloc/bloc.dart';
import 'package:bloc_3/bloc/create_post_event.dart';
import 'package:bloc_3/bloc/create_post_state.dart';
import 'package:bloc_3/model/post.dart';
import 'package:bloc_3/service/network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateBloc extends Bloc<CreateEvent, CreatePostState> {
  CreateBloc() : super(CreatePostInitial()) {
    on<CreatePostEvent>(_onCreatePost);
  }

  Future<void> _onCreatePost(CreatePostEvent event, Emitter<CreatePostState> emit) async {
    emit(CreatePostLoading());
    final response = await Network.POST(
        Network.API_CREATE, Network.paramsCreate(event.post));
    if (response != null) {
      Post post = Network.parsePostList(response) as Post;
      emit(CreatedPostState(post));
    } else {
      emit(CreatePostError("Not Created"));
    }
  }
}
