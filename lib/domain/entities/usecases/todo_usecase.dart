import 'package:todo/data/repository/todo_fech.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/repository/todo_repository.dart';


class TodoUseCases {
  TodoRepo todoRepo = TodoRepoImpl();
  Future<List<TodoEntity>> getTodoFromDataSource() async {
    final todo = await todoRepo.getTodoformDataSource();
    print(todo);
    return todo;
  }
}
