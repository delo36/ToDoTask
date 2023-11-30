import '../models/to_do_model.dart';

class TodoList {
  static final List<TodoModel> _todos = [];

  static List<TodoModel> get todos => _todos;
  static void addTodo(TodoModel todo) {
    if (_todos.contains(todo)) return;
    _todos.add(todo);
  }

  /// TODO: Assignment 1 - add edit and delete function for [_todos] list
  static final List<TodoModel> _doneTodos = [];
  static List<TodoModel> get doneTodos => _doneTodos;
  static void addDoneTodo(TodoModel todo) {
    if (_doneTodos.contains(todo)) return;
    _doneTodos.add(todo);
  }

  static void deleteTodo(TodoModel todo) {
    _todos.remove(todo);
  }

  static List<TodoModel> get editTodos => _todos;
  static void editTodo(TodoModel todo) {
    _todos.remove(todo);

    if (_todos.contains(todo)) return;

    _todos.add(todo);
  }
}
