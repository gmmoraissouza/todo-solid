import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_solid/controller/todos_controller.dart';

import 'widget/add_todo_widget.dart';
import 'widget/todo_widget.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Tarefas')),
      ),
      body: Consumer<TodosController>(builder: (context, controller, _) {
        final todoItems = controller.listTodos;

        if (todoItems.isEmpty) {
          return const Center(
            child: Text('Nenhuma tarefa...'),
          );
        }
        return ListView.builder(
            itemCount: todoItems.length,
            itemBuilder: (context, index) => Card(
                  child: TodoWidget(
                      deleteTodo: () => controller.removeTodo(index),
                      tapTodo: () => controller.tapTodo(index),
                      titleTodo: todoItems[index].title,
                      statusTodo: todoItems[index].isDone),
                ));
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showModalBottomSheet(
          builder: (_) => const AddTodoWidget(),
          context: context,
          isScrollControlled: true,
        ),
        label: const Text('Nova tarefa'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
