import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/entities/usecases/todo_usecase.dart';


part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TodoRequestEvent>((event, emit) async {
      emit(TodoStateLoading());
      try {
        final todo = await TodoUseCases().getTodoFromDataSource();
        emit(TodoStateLoaded(todo: todo));
      } catch (e) {
        emit(TodoStateError(massage: e.toString()));
      }
    });
  }
}
