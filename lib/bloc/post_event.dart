part of 'post_bloc.dart';

//Event is something that is triggered by user actions depending on user actions we define events
sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

//defining a LoadPostsEvent
class LoadPostsEvent extends PostEvent {
  @override
  List<Object> get props => [];
}
