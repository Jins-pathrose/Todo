import 'dart:convert';

import 'package:todo/data/models/todofech_model.dart';
import 'package:http/http.dart' as http;

abstract class TodoRemoteDatasource {
  Future<List<TodoModel>> getTodoFromApi();
}

class TodoRemoteDataSourceImpl implements TodoRemoteDatasource {
  final client = http.Client();
  @override
  Future<List<TodoModel>> getTodoFromApi() async {
    try {
      final response = await client.get(
        Uri.parse('https://api.nstack.in/v1/todos?page=1&limit=10'),
        // headers: {'content-type': 'application/json'}
      );

      if (response.statusCode == 200) {
        print("fetch success ${response.statusCode}");
        print(response.body);
        List json = jsonDecode(response.body)['items'];
        List<TodoModel> list =
            json.map((json) => TodoModel.fromJosn(json)).toList();
        return list;
      } else {
        throw Exception('Failed to Load');
      }
    } catch (e) {
      print('$e');
      throw Exception('$e');
    }
  }
}

class HomeRepo {
  Future<void> postApi(String title, String description) async {
    final body = {
      'title': title,
      'description': description,
      'is_completed': true
    };
    const url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    try {
      response.statusCode == 200 ? print(response.body) : print('some error');
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteValue(String id) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response =
        await http.delete(uri, headers: {'Content-Type': 'application/json'});
    try {
      response.statusCode == 200 ? print(response.body) : print('someerror');
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> editValue(String id, String title, String description) async {
    final body = {
      'title': title,
      'description': description,
      'is_completed': false
    };
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.put(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    if (response.body == 200) {
      print('data updated');
    } else {
      print('having some errors in edit');
    }
    print(response.statusCode);
  }
}
