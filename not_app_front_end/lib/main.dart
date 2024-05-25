import 'package:flutter/material.dart';
import 'package:not_app_front_end/api/api.dart';
import 'package:not_app_front_end/screens/addtodo.dart';
import 'package:not_app_front_end/screens/update_todo.dart';
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
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoProvider todoProvider = Provider.of<TodoProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Center(child: Icon(Icons.add, color: Colors.white,),),
        shape: CircleBorder(),
        onPressed: (){
          Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => AddTodo())
          );

        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Home',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoProvider.todos.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              leading: IconButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateTodo(
                        todo: todoProvider.todos[index],
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.update)
              ),
              title: Text(
                  todoProvider.todos[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20
                ),
              ),
              subtitle: Text(
                todoProvider.todos[index].description,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    print("you press to delee");
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



