import 'package:flutter/material.dart';
import 'package:to_do_app/app/screen/task/widgets/task_card_widget.dart';
import 'package:to_do_app/app/screen/task/widgets/task_efficiency_circle_widget.dart';
import '../../models/to_do_model.dart';
import '../../values/colors.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen(
      {super.key,
      required this.todoList,
      required this.onTodoDone,
      required this.doneList,
      required this.onTodoDelete,
      required this.onTodoEdit});

  final List<TodoModel> todoList;
  final Function(TodoModel) onTodoDone;
  final Function(TodoModel) onTodoDelete;
  final Function(TodoModel) onTodoEdit;
  final List<TodoModel> doneList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: 32,
            )),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.account_circle,
              size: 32,
            ),
          )
        ],
      ),
      body: Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaskEfficiencyCircleWidget(
                doneList: doneList,
                todoList: todoList,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Doing Tasks",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TaskCardWidget(
                todoList: todoList,
                onTodoDone: onTodoDone,
                onTodoDelete: onTodoDelete,
                onTodoEdit: onTodoEdit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
