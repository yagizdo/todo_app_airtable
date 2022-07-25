import '../model/todo.dart';

abstract class INetworkService {
  Future<List<Todo>> getAllTodos();
  Future<void> addTodo(Todo todo);
  Future<void> deleteTodo(Todo todo);
}
