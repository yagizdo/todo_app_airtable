part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class GetAllTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final Todo todo;

  AddTodo(this.todo);
}
