part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class GetTodosState extends TodoState {
  final List<Todo> todos;

  GetTodosState(this.todos);
}
