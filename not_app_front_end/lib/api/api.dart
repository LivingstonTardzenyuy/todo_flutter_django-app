import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';


class TodoProvider extends ChangeNotifier{
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  final baseUrl = "http://127.0.0.1:8005";
  fetchTodo() async {
    final response = await http.get(Uri.parse("${baseUrl}/apis/v1/?format=json#"));

    if (response.statusCode == 200){
        var data = json.decode(response.body) as List;   // Since we will have multiple responses we keep as a list
    }
  }
}