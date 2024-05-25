import 'package:flutter/material.dart';
import 'package:not_app_front_end/api/api.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';


class AddTodo extends StatefulWidget {
  AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController textEditingController= TextEditingController();
  final TextEditingController descriptionEditingController= TextEditingController();

  void onAdd(){
    final String textVal = textEditingController.text;
    final String descriptionVal = descriptionEditingController.text;

    if (textVal.isNotEmpty && descriptionVal.isNotEmpty){
      final Todo todo = new Todo(
          title: textVal,
          description: descriptionVal,
          );
      Provider.of<TodoProvider>(context, listen: false).addTodo(todo);
      Navigator.pop(context);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ListView(
            children: [
              TextField(
                controller: textEditingController,
              ),

              const SizedBox(height: 20,),
              TextField(
                controller: descriptionEditingController,
              ),

              const SizedBox(height: 40,),
              InkWell(
                onTap: (
                  onAdd
                ),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,

                  ),
                  child: Center(
                    child: Text(
                      'Add Todo',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  )
                )
              )
            ],
          ),
        )
    );
  }
}
