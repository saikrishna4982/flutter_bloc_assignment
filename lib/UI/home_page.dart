// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/bloc/post_bloc.dart';
import 'package:second/model/postsmodel.dart';
import 'package:second/repository/repo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //before we use bloc we need t specify the pblocroviders that we can use
    return MultiBlocProvider(
      //added a PostBloc provider
      providers: [
        BlocProvider<PostBloc>(
          create: (context) => PostBloc(PostRepository()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "P O S T S",
          ),
        ),
        //calling the body of the app
        body: blocBody(),
      ),
    );
  }

  Widget blocBody() {
    // as we are using a Bloc we need to return a BlocProvider in the widget body
    return BlocProvider(
      //here i am triggering my first event i.e LoadPostsEvent
      create: (context) => PostBloc(
        PostRepository(),
      )..add(LoadPostsEvent()),
      //here defining the builder for building the widgets based on the state
      //basically block builder takes two things one is Bloc & Other is state
      //so here i am defining my project Bloc & State
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          //here we are checking if the current state is equal to PostInitialState then show loading indicator
          if (state is PostInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          //checking if it's an error then tell inform the user about the error
          if (state is PostErrorState) {
            return Center(child: Text(state.error));
          }
          //here we begin to show the posts if the state is changed to PostLoadedState
          if (state is PostLoadedState) {
            //getting our posts
            List<Posts> posts = state.posts;
            //Pull-Down-To Refresh
            return RefreshIndicator(
              onRefresh: () async {
                //when the user pulls down we are again triggering the LoadPostsEvent
                context.read<PostBloc>().add(LoadPostsEvent());
              },
              //displaying our posts by using a ListView.builder
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                      color: Color.fromARGB(255, 52, 106, 131),
                      child: ListTile(
                        title: Text(
                          '${posts[index].title}',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${posts[index].body?.replaceAll("\n", "")}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
