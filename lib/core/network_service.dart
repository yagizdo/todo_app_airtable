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

  // Model example
  /*

  "fields": {
            "title": todo.fields!.title,
            "description": todo.fields?.description ?? "",
            "file": [
              {
                "url":
                    "https://dl.airtable.com/.attachments/abe36ae626bf1e27ea6aa367669e1d47/0913658a/todo.png?ts=1658687203&userId=usrwTzN0QAnEIShut&cs=ab9a9d3e57a47b8f"
              }
            ]
          }

   */
  @override
  Future<void> addTodo(Todo todo) async {
    await dio.post('$baseUrl/v0/$appID/Todos',
        data: {
          "fields": {
            "title": todo.fields!.title,
            "description": todo.fields?.description ?? "",
          }
        },
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKey",
        }));
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await dio.delete('$baseUrl/v0/$appID/Todos/${todo.id}',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKey",
        }));
  }
}
