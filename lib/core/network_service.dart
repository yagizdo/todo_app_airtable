import 'package:dio/dio.dart';
import 'package:todo_app_airtable/core/i_network_service.dart';
import 'package:todo_app_airtable/core/network_client.dart';
import 'package:todo_app_airtable/model/todo.dart';

class NetworkService extends NetworkClient implements INetworkService {
  @override
  Future<List<Todo>> getAllTodos() async {
    List<Todo> todos = [];

    Response response = await dio
        .get('$baseUrl/v0/$appID/Todos', queryParameters: {"api_key": apiKey});

    var parsedList = response.data['records'];

    todos = parsedList.map<Todo>((todo) => Todo.fromJson(todo)).toList();

    return todos;
  }

  @override
  Future<void> addTodo(Fields todo) async {
    dio.options.headers['content-Type'] = 'application/json';

    await dio.post('$baseUrl/v0/$appID/Todos',
        queryParameters: {"data": Fields(title: 'Test', description: 'Test2')});
  }
}
