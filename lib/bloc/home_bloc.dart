import 'package:bloc_3/bloc/home_event.dart';
import 'package:bloc_3/bloc/home_state.dart';
import 'package:bloc_3/pages/create_page.dart';
import 'package:bloc_3/service/network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> { // Fixed type parameters
  HomeBloc() : super(HomeInit()) {
    on<LoadPostsEvent>(_onLoadPost);
    on<DeletePostEvent>(_onDeletePost);
  }

  Future<void> _onLoadPost(
      LoadPostsEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    final response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      final posts = Network.parsePostList(response);
      emit(HomePostListState(posts));
    }
  }

  Future<void> _onDeletePost(
      DeletePostEvent event, Emitter<HomeState> emit) async {
    final response =
    await Network.DEL(Network.API_DELETE, Network.paramsEmpty());
    if (response != null) {
      final posts = Network.parsePostList(response);
      emit(HomePostListState(posts)); // Fixed state emission
    }
  }

  void callCreatePage(BuildContext context) async {
//    var results = await Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => BlocProvider(
//               create: (context) => CreateBloc(),
//               child: CreateData(),
//             )));
//     if (results != null) {
//       add(LoadPostsEvent());
//     }
  }
}
