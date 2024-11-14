import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/data/datasource/postremortdatasource.dart';

part 'delete_event.dart';
part 'delete_state.dart';

class DeleteBloc extends Bloc<DeleteEvent, DeleteState> {
  HomeRepo rep;
  DeleteBloc(this.rep) : super(DeleteInitial()) {
    on<TodoDeleteEvent>((event, emit) {
      emit(DeleteInitial());
      rep.deleteValue(event.id);
    });
  }
}
