import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app_airtable/core/network_service.dart';

import '../model/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final NetworkService networkService = NetworkService();
  List<Todo> todos = [];

  TodoBloc() : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {});
    on<GetAllTodos>((event, emit) async {
      emit(LoadingState(true));
      todos = await networkService.getAllTodos();

      emit(LoadingState(false));
      emit(GetTodosState(todos));
    });

    on<AddTodo>((event, emit) async {
      await networkService.addTodo(event.todo);
      emit(LoadingState(true));
      todos = await networkService.getAllTodos();
      emit(LoadingState(false));
      emit(GetTodosState(todos));
    });
  }
}
