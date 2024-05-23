class Todo{
  final int id;
  final String title;
  final String description;

  Todo({
    required this.id,
    required this.title,
    required this.description
  });


  // Convert from Json to our dart format string
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description']
    );
  }


  // Convert our dart format string to Json so we can send to backEnd


}