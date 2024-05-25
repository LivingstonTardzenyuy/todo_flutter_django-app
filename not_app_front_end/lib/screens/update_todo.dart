import 'package:flutter/material.dart';
import 'package:not_app_front_end/api/api.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';


class UpdateTodo extends StatefulWidget {
  UpdateTodo({super.key, required this.todo});
  final Todo todo;
  @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  late final TextEditingController textEditingController;
  late final TextEditingController descriptionEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController(text: widget.todo.title);
    descriptionEditingController = TextEditingController(text: widget.todo.description);
  }

  updateTodoButton(){
    final Todo todo=new Todo(
      id: widget.todo.id,
      title: textEditingController.text,
      description: descriptionEditingController.text,
    );
    Provider.of<TodoProvider>(context, listen:false).updateTodo(todo);
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Update Todo',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
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
                  updateTodoButton()
                  ),
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,

                      ),
                      child: Center(
                          child: Text(
                            'Update Todo',
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
