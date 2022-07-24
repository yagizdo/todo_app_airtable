import 'package:flutter/material.dart';
import 'package:todo_app_airtable/core/network_service.dart';
import 'package:todo_app_airtable/widget/todo_builder.dart';

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
    getTodos = _networkService.getAllTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TodoBuilder(
        future: getTodos,
      ),
    );
  }
}
