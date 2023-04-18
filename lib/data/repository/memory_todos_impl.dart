import '../model/todo_model.dart';
import 'todos_repository.dart';

class MemoryTodosImpl extends TodosRepository {
  final _todos = <TodoModel>[];

  @override
  Future<bool> create(TodoModel todoItem) {
    _todos.add(todoItem);
    return Future.value(true);
  }

  @override
  Future<bool> remove(TodoModel todoItem) {
    _todos.remove(todoItem);
    return Future.value(true);
  }

  @override
  Future<List<TodoModel>> fetchAll() async {
    return Future.value(_todos);
  }

  @override
  Future<bool> update(TodoModel todoItem) {
    return Future.value(true);
  }
}
