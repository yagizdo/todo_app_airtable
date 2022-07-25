import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/todo_bloc.dart';
import '../model/todo.dart';

class AddTodoView extends StatefulWidget {
  const AddTodoView({Key? key}) : super(key: key);

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  // Title Controller
  late TextEditingController titleController;

  // Description Controller
  late TextEditingController descController;

  // Form key
  late dynamic _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    titleController = TextEditingController();
    descController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Todo'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // Title
            Padding(
              padding: EdgeInsets.all(10.w),
              child: TextFormField(
                controller: titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title is required.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  errorStyle:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  hintText: 'Title',
                ),
              ),
            ),

            // Description
            Padding(
              padding: EdgeInsets.all(10.w),
              child: TextFormField(
                controller: descController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  hintText: 'Description',
                ),
              ),
            ),

            // Sizedbox for padding
            SizedBox(
              height: 10.h,
            ),

            // Add To-do Button
            SizedBox(
              width: 355.w,
              height: 40.h,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Todo todo = Todo(
                        fields: Fields(
                            title: titleController.text,
                            description: descController.text));
                    BlocProvider.of<TodoBloc>(context).add(AddTodo(todo));
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: const Text(
                  'Add Todo',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
