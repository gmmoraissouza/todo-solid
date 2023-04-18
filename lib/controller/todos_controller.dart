import 'package:flutter/material.dart';

import '../data/model/todo_model.dart';
import '../data/repository/todos_repository.dart';

class TodosController extends ChangeNotifier {
  final TodosRepository todosRepository;
  List<TodoModel> listTodos = [];

  TodosController(this.todosRepository) {
    loadItems();
  }

  Future<List<TodoModel>> loadItems() async {
    listTodos = await todosRepository.fetchAll();
    notifyListeners();
    return listTodos;
  }

  Future<void> tapTodo(int index) async {
    final todo = listTodos[index].copyWith(isDone: !listTodos[index].isDone);

    final sucess = await todosRepository.update(todo);

    if (sucess) {
      listTodos.replaceRange(index, index + 1, [todo]);
    }
    notifyListeners();
  }

  Future<bool> createTodo(String title) async {
    final todo = TodoModel(
      isDone: false,
      title: title,
      createdAt: DateTime.now(),
    );

    final sucess = await todosRepository.create(todo);

    if (sucess) {
      listTodos = await todosRepository.fetchAll();
      notifyListeners();
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<void> removeTodo(int index) async {
    final todo = listTodos[index];

    final sucess = await todosRepository.remove(todo);

    if (sucess) {
      listTodos.remove(todo);
    }
    notifyListeners();
  }
}
