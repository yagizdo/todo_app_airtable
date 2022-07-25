import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_airtable/bloc/todo_bloc.dart';
import 'package:todo_app_airtable/widget/todo_list.dart';

class TodoBuilder extends StatefulWidget {
  const TodoBuilder({Key? key}) : super(key: key);

  @override
  State<TodoBuilder> createState() => _TodoBuilderState();
}

class _TodoBuilderState extends State<TodoBuilder> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is LoadingState && isLoading == true) {
          // If data not loading set isLoading false
          Timer.periodic(const Duration(seconds: 5), (timer) {
            setState(() {
              isLoading = false;
            });
          });
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (state is GetTodosState) {
          if (BlocProvider.of<TodoBloc>(context).todos.isEmpty) {
            return const Center(
              child: Text('U dont have todos'),
            );
          }
          return TodoList(state: state);
        } else {
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
      },
    );
  }
}
