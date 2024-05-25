
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


  Future<void> deleteTodo(Todo todo) async {
    final response = await http.delete(Uri.parse(
        "$baseUrl/apis/v1/${todo.id}/"
    ));

    if (response.statusCode == 204){
      _todos.remove(todo);
      notifyListeners();
    }
  }

  Future <void> updateTodo(Todo todo) async{
    final response = await http.put(Uri.parse(
      "$baseUrl/apis/v1/${todo.id}/"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(todo.toJson())
    );
    if (response.statusCode == 200){
      // _todos.remove(todo);
      // _todos.add(todo);
      notifyListeners();
    }
  }
  Future<void> addTodo(Todo todo) async {
    final response = await http.post(Uri.parse("$baseUrl/apis/v1/"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(todo.toJson())
    );
    if (response.statusCode == 201){
      todo.id = json.decode(response.body)['id'];       // we write like this b/c the ID is being set from backEnd hence we don't have to define it
      _todos.add(todo);
      notifyListeners();
    } else{
      throw Exception('Failed to add todo');
    }
  }
}
