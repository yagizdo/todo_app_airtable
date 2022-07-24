import '../model/todo.dart';

abstract class INetworkService {
  Future<List<Todo>> getAllTodos();
}
