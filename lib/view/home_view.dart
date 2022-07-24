import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_airtable/core/network_service.dart';
import 'package:todo_app_airtable/view/add_todo_view.dart';
import 'package:todo_app_airtable/widget/todo_builder.dart';

import '../bloc/todo_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final NetworkService _networkService = NetworkService();
  late dynamic getTodos;
  @override
  void initState() {
    BlocProvider.of<TodoBloc>(context).add(GetAllTodos());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 70.w,
        width: 70.w,
        child: FloatingActionButton(
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTodoView(),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add),
              Text(
                'Add Todo',
                style: TextStyle(fontSize: 11.sp),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: const TodoBuilder(),
    );
  }
}
