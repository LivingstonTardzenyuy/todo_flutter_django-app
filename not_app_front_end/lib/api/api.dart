import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'package:http/http.dart' as http;


class TodoProvider with ChangeNotifier{
  TodoProvider(){
    this.fetchTasks();
  }
  // final baseUrl = 'http://127.0.0.1:8003';
  final baseUrl = "http://10.0.2.2:8005";

  List<Todo> _todos= [];
  List<Todo> get todos => _todos;

  fetchTasks() async {
    // final response = await http.get('$baseUrl/apis/v1/?format=json');
    final response = await http.get(Uri.parse('$baseUrl/apis/v1/?format=json'));

    if (response.statusCode == 200){
      var data = json.decode(response.body) as List; // we are decoding the response and returning as a list b/c we will have many objects
      _todos = data.map((i) => Todo.fromJson(i)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load todos');
    }


  }

  void addTodo(Todo todo) async {
    final response = await http.post(
        Uri.parse(
            '$baseUrl/apis/v1/?format=json'),
          headers: {
              "Content-Type": "application/json"
          },
          body: json.encode(todo)
    );
    if(response.statusCode == 201){
      _todos.add(todo);
      notifyListeners();
    }
  }
}
