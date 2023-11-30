import 'package:flutter/material.dart';
import 'component/body_widget.dart';
import 'component/new_task_widget.dart';
import 'config/to_do_list.dart';
import 'models/to_do_model.dart';

class RouteApp extends StatefulWidget {
  const RouteApp({super.key});

  @override
  State<RouteApp> createState() => _RouteAppState();
}

class _RouteAppState extends State<RouteApp> {
  int pageIndex = 0;
  List<IconData> iconItems = [
    Icons.task,
    Icons.task_alt,
  ];

  List<String> iconLabels = [
    'Doing Task',
    'Completed Task',
  ];

  final List<TodoModel> tempTodoList = TodoList.todos;
  final List<TodoModel> tempDoneList = TodoList.doneTodos;

  void editTodo(TodoModel todo) {
    setState(() {
      tempTodoList.remove(todo);
    });
  }

  void deleteTodo(TodoModel todo) {
    setState(() {
      tempDoneList.remove(todo);
      TodoList.deleteTodo(todo);
    });
  }

  void addTodo(TodoModel todo) {
    setState(() {
      tempTodoList.add(todo);
      TodoList.addTodo(todo);
    });
  }

  void doneTodo(TodoModel todo) {
    setState(() {
      tempTodoList.remove(todo);
      TodoList.addDoneTodo(todo.copyWith(
        isDone: true,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWidget(
        pageIndex: pageIndex,
        todoList: tempTodoList,
        onTodoDone: doneTodo,
        doneList: tempDoneList,
        onTodoDelete: deleteTodo,
        onTodoEdit: editTodo,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        items: List.generate(
          iconItems.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(iconItems[index]),
            label: iconLabels[index],
          ),
        ),
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
      floatingActionButton: ClipOval(
        child: FloatingActionButton(
          onPressed: () async {
            pageIndex;
            final returnVal = await showModalBottomSheet(
              context: context,
              builder: (context) => const NewTaskWidget(),
            );
            if (returnVal != null) {
              addTodo(returnVal as TodoModel);
            }
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
