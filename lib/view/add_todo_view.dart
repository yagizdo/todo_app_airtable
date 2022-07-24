import 'package:flutter/material.dart';

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

  @override
  void initState() {
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
        child: Column(
          children: [
            // Title
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                  Radius.elliptical(20, 30),
                )),
              ),
            ),

            // Description
            TextFormField(
              controller: descController,
              decoration: const InputDecoration(
                hintText: 'Description',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                  Radius.elliptical(20, 30),
                )),
              ),
            ),

            // Add To-do Button
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
