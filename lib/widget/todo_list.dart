import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_airtable/bloc/todo_bloc.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key, required this.state}) : super(key: key);
  final dynamic state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: state.todos.length,
        itemBuilder: (context, index) {
          var todo = state.todos[index];
          return ListTile(
            title: Text(todo.fields!.title ?? 'No title'),
            subtitle: Text(todo.fields!.description ?? ''),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                BlocProvider.of<TodoBloc>(context).add(DeleteTodo(todo));
              },
            ),
          );
        });
  }
}
