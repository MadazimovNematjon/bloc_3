

import 'package:bloc_3/bloc/home_bloc.dart';
import 'package:bloc_3/bloc/home_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_state.dart';
import '../model/post.dart';
import '../views/item_of_post_view.dart';

class HomePage extends StatefulWidget {
  static String get id => "home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 late HomeBloc homeBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     homeBloc = BlocProvider.of<HomeBloc>(context);
     homeBloc.add(LoadPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocBuilder<HomeBloc,HomeState>(
        builder: (BuildContext context,HomeState state){
          if(state is HomeError){
            return viewOfError(state.error!);
          }

          if(state is HomePostListState){
            return viewOfHome(state.posts);
          }
          return viewOfLoading();
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
      ),
    );
  }

  Widget viewOfHome(List<Post> items){
    return  ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          Post post = items[index];
          return itemPost(context,homeBloc,post);
        },
      );
  }

  Widget viewOfError(String err){
    return Center(child: Text(err),);
  }
 Widget viewOfLoading(){
    return Center(child: CircularProgressIndicator(),);
 }


}
