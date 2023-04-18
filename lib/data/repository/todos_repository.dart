import '../model/todo_model.dart';

abstract class TodosRepository {
  Future<List<TodoModel>> fetchAll();

  Future create(TodoModel todoItem);

  Future update(TodoModel todoItem);

  Future remove(TodoModel todoItem);
}
