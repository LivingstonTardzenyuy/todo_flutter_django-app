
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';


class TodoProvider extends ChangeNotifier{
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  TodoProvider(){
    this.fetchTodo();
  }
  // final baseUrl = "http://127.0.0.1:8005";
  final baseUrl = "http://10.0.2.2:8005";

  fetchTodo() async {
    final response = await http.get(Uri.parse("$baseUrl/apis/v1/?format=json"));

    if (response.statusCode == 200){
        var data = json.decode(response.body) as List;   // Since we will have multiple responses we keep as a list
        _todos = data.map<Todo>((i) => Todo.fromJson(i)).toList();
        notifyListeners();
    }
    else{
      throw Exception('Failed to load todos');
    }
  }


  deleteTodo(Todo todo) async {
    final response = await http.delete(Uri.parse(
        "$baseUrl/apis/v1/${todo.id}/"
    ));

    if (response.statusCode == 204){
      _todos.remove(todo);
      notifyListeners();
    }
  }
}