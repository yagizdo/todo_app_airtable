import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app_airtable/core/network_service.dart';

import '../model/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final NetworkService networkService = NetworkService();

  TodoBloc() : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {});
    on<GetAllTodos>((event, emit) async {
      List<Todo> todos = [];

      todos = await networkService.getAllTodos();

      for (var i in todos) {
        print(i.fields!.title);
      }

      emit(GetTodosState(todos));
    });

    on<AddTodo>((event, emit) {});
  }
}
