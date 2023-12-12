import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:second/model/postsmodel.dart';
import 'package:second/repository/repo.dart';

part 'post_event.dart';
part 'post_state.dart';

//This is where our Bloc implementation starts
class PostBloc extends Bloc<PostEvent, PostState> {
  //in this PostBloc class we are using a variable to store our posts.
  final PostRepository _postRepository;

  //as soon as the LoadPostsEvent is triggerd the following PostBloc starts executing
  PostBloc(this._postRepository) : super(PostInitialState()) {
    //we're defining that it it's a LoadPostsEvent then do the following
    on<LoadPostsEvent>((event, emit) async {
      //emitting PostInitialState
      emit(PostInitialState());
      try {
        //fetching our posts from the repo
        final posts = await _postRepository.getPosts();
        //upon successful fetching emiting our posts through PostLoadedState(posts)
        //thus results in change of UI as new state is emitted
        emit(PostLoadedState(posts));
      } // checking & catching for any errors & exceptions during fetchig
      //emitthing those errors by using PostErrorState
      catch (e) {
        emit(PostErrorState(e.toString()));
      }
    });
  }
}
