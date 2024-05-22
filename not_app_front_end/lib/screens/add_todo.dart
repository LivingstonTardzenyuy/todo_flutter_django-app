import 'package:flutter/material.dart';
import 'package:not_app_front_end/api/api.dart';
import 'package:provider/provider.dart';

import '../models/todo.dart';

class AddTodo extends StatelessWidget {
   AddTodo({super.key});

  final TextEditingController todoTitleController = new TextEditingController();
  final TextEditingController todoDescriptionController = new TextEditingController();

  void onAdd(BuildContext context) {
    final String textVal = todoTitleController.text;
    final String descVal = todoDescriptionController.text;
    if (textVal.isNotEmpty || descVal.isNotEmpty) {
      final Todo todo = Todo(
        title: textVal,
        description: descVal,
        id: null,
      );
      // Provider.of<TodoProvider>(context, listen: false).addTodo(todo);
      Provider.of<TodoProvider>(context,listen:false).addTodo(todo);
      Navigator.of(context).pop();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),

      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                TextField(
                  controller: todoTitleController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                ),

                const SizedBox(height: 20,),
                TextField(
                  controller: todoDescriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                ),

                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    onAdd(context);
                  },
                  child: Text('Add Todo'),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
