part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class TodoPostEvent extends PostEvent {
  String title;
  String description;
  TodoPostEvent({required this.title, required this.description});
}
