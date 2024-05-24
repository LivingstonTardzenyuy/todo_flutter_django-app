import 'package:flutter/material.dart';


class AddTodo extends StatelessWidget {
  AddTodo({super.key});


  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController= TextEditingController();
    final TextEditingController descriptionEditingController= TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
        body: ListView(
          children: [
            TextField(
              controller: ,
            )
          ],
        )
    );
  }
}
