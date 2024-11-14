part of 'edit_bloc.dart';

sealed class EditEvent extends Equatable {
  const EditEvent();

  @override
  List<Object> get props => [];
}

class TodoEditEvent extends EditEvent {
  String id;
  String title;
  String description;
  TodoEditEvent(
      {required this.id, required this.description, required this.title});
}
