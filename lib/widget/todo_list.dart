import 'package:flutter/material.dart';

import '../model/todo.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key, required this.snapshot}) : super(key: key);
  final dynamic snapshot;

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasData) {
      var data = snapshot.data;
      return ListView.builder(
        itemCount: data!.length,
        itemBuilder: (context, index) {
          Todo todo = data[index];
          return ListTile(
            title: Text(todo.fields!.title ?? 'No title'),
            subtitle: Text(todo.fields!.description ?? ''),
          );
        },
      );
    } else if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return const Center(
        child: Text('No todos'),
      );
    }
  }
}
