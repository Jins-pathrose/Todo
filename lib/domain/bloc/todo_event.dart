part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TodoRequestEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}
