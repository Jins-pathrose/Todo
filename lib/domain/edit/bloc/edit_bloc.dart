import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/data/datasource/postremortdatasource.dart';

part 'edit_event.dart';
part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  HomeRepo rep;
  EditBloc(this.rep) : super(EditInitial()) {
    on<TodoEditEvent>((event, emit) {
      rep.editValue(event.id, event.title, event.description);
    });
  }
}
