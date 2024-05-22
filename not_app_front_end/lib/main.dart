import 'package:flutter/material.dart';
import 'package:not_app_front_end/api/api.dart';
import 'package:not_app_front_end/screens/add_todo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoProvider todoProvider = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Todo App', style: TextStyle(color: Colors.white),),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (
              context) =>AddTodo()));
          // todoProvider.addTodo(Todo(title: '', description: ''));
        },
        tooltip: 'Add Todo',
        child: Icon(Icons.add),

      ),
      body: ListView.builder(
        itemCount: todoProvider.todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todoProvider.todos[index].title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800
              ),
            ),
            subtitle: Text(todoProvider.todos[index].description),
            trailing: IconButton(
              onPressed: () {
                todoProvider.deleteTodo(todoProvider.todos[index]);
              },
              icon: Icon(Icons.delete, color: Colors.red,)
            ),
          );
        }
      )
    );
  }
}

