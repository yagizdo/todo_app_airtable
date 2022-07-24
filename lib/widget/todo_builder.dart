import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_airtable/bloc/todo_bloc.dart';
import 'package:todo_app_airtable/widget/todo_list.dart';

class TodoBuilder extends StatelessWidget {
  const TodoBuilder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (state is GetTodosState) {
          return TodoList(state: state);
        } else {
          return const Center(
            child: Text('U dont have todos'),
          );
        }
      },
    );
  }
}
