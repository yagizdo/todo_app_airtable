import 'package:flutter/material.dart';

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
          );
        });
  }
}
