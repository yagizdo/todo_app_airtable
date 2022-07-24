import 'package:flutter/material.dart';
import 'package:todo_app_airtable/widget/todo_list.dart';

import '../model/todo.dart';

class TodoBuilder extends StatelessWidget {
  const TodoBuilder({Key? key, required this.future}) : super(key: key);
  final dynamic future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
        return TodoList(snapshot: snapshot);
      },
    );
  }
}
