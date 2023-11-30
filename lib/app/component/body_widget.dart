import 'package:flutter/material.dart';
import '../models/to_do_model.dart';
import '../screen/complete_task/complete_task.dart';
import '../screen/task/task.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
    required this.pageIndex,
    required this.todoList,
    required this.onTodoDone,
    required this.doneList,
    required this.onTodoDelete,
    required this.onTodoEdit,
  });

  final int pageIndex;
  final List<TodoModel> todoList;
  final List<TodoModel> doneList;
  final Function(TodoModel) onTodoDone;
  final Function(TodoModel) onTodoDelete;
  final Function(TodoModel) onTodoEdit;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      alignment: Alignment.center,
      index: pageIndex,
      children: [
        TaskScreen(
          todoList: todoList,
          onTodoDone: onTodoDone,
          doneList: doneList,
          onTodoDelete: onTodoDelete,
          onTodoEdit: onTodoEdit,
        ),
        CompleteTaskScreen(
          doneList: doneList,
          todoList: todoList,
        )
      ],
    );
  }
}
