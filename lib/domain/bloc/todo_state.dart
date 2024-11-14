part of 'todo_bloc.dart';

@immutable
sealed class TodoState extends Equatable {}

final class TodoInitial extends TodoState {
  @override
  List<Object?> get props => [];
}

class TodoStateLoading extends TodoState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TodoStateLoaded extends TodoState {
  final List<TodoEntity> todo;
  TodoStateLoaded({required this.todo});
  @override
  List<Object?> get props => [];
}

class TodoStateError extends TodoState {
  final String massage;
  TodoStateError({required this.massage});
  @override
  List<Object?> get props => [];
}
