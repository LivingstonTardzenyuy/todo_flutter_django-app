import 'package:flutter/material.dart';

class Todo{
   int? id;
  final String title;
  final String description;

  Todo({required this.id, required this.title, required this.description});


  // for fetching the data
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"],
      title: json["title"],
      description: json["description"],
    );
  }


  // for saving the data
  dynamic toJson() => {
    'id': id,
    'title': title,
    'description': description,
  };
}

