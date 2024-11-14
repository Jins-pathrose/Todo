

import 'package:todo/data/datasource/postremortdatasource.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/repository/todo_repository.dart';

class TodoRepoImpl implements TodoRepo {
  TodoRemoteDatasource todoRemoteDatasource = TodoRemoteDataSourceImpl();
  @override
  Future<List<TodoEntity>> getTodoformDataSource() async {
    final todo = await todoRemoteDatasource.getTodoFromApi();
    return todo;
  }
}
