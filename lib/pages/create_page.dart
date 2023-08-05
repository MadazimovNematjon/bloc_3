import 'package:bloc_3/bloc/create_post_event.dart';
import 'package:bloc_3/model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/create_bloc.dart';
import '../bloc/create_post_state.dart';


class CreateData extends StatefulWidget {
  static String get id => "create_data";

  const CreateData({Key? key}) : super(key: key);

  @override
  State<CreateData> createState() => _CreateDataState();
}

// ... (imports and other code)

class _CreateDataState extends State<CreateData> {
  late CreateBloc createBloc;
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    createBloc = BlocProvider.of<CreateBloc>(context);
    createBloc.stream.listen((state) {
      if(state is CreatedPostState){
        // Handle CreatedPostState
      }
      if(state is CreatePostError){
        // Handle CreatePostError
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Create Data")),
        body: BlocBuilder<CreateBloc, CreatedPostState>(
            builder: (BuildContext context, CreatedPostState state) {
              if(state is CreatePostLoading){
                return viewOfCreate(createBloc,
                    true, context, titleController, bodyController
                );
              }
              // Handle other states
              return const SizedBox.shrink();
            }
        )
    );
  }
}

Widget viewOfCreate(CreateBloc createBloc,
    bool isLoading,
    BuildContext context,
    TextEditingController titleController,
    TextEditingController bodyController,
    ) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          controller: titleController, // Connect the controller
          decoration: const InputDecoration(
            hintText: "Title",
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: bodyController, // Connect the controller
          decoration: const InputDecoration(
            hintText: "Body",
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            final post = Post(title: titleController.text.toString().trim(),body: bodyController.text.toString().trim());
            createBloc.add(CreatePostEvent(post));
          },
          child: const Text("Create"),
        ),
      ],
    ),
  );
}



