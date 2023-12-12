part of 'post_bloc.dart';
// State is something that can be refferred as response from bloc.
//when a user triggers an event the block does it's communication with state
//finally emits the state & depending on state ui will change

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

//defining our Initial post state
final class PostInitialState extends PostState {}

//defining the state after posts are loaded
class PostLoadedState extends PostState {
  final List<Posts> posts;
  PostLoadedState(this.posts);
  @override
  List<Object> get props => [];
}

//in case of errors defining how the state should look like
class PostErrorState extends PostState {
  final String error;
  PostErrorState(this.error);
  @override
  List<Object> get props => [];
}
