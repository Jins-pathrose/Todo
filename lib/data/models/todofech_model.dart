
import 'package:todo/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  TodoModel(
      {required title,
      required sId,
      required description,
      required isCompleted,
      required createdAt,
      required updateAt})
      : super(
            sId: sId,
            title: title,
            description: description,
            isCompleted: isCompleted,
            createdAt: createdAt,
            updateAt: updateAt);

  factory TodoModel.fromJosn(Map json) {
    return TodoModel(
        title: json['title'],
        sId: json['_id'],
        description: json['description'],
        isCompleted: json['is_completed'],
        createdAt: json['created_at'],
        updateAt: json['updated_at']);
  }
}
