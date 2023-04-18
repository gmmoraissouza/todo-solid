import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_solid/controller/todos_controller.dart';

import 'data/repository/memory_todos_impl.dart';
import 'data/repository/todos_repository.dart';
import 'view/home.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<TodosRepository>(create: (_) => MemoryTodosImpl()),
      ChangeNotifierProvider<TodosController>(
          create: (context) =>
              TodosController(context.read<TodosRepository>())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List Arch',
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      home: const Home(),
    );
  }
}
