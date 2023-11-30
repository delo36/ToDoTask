import 'package:flutter/material.dart';
import 'package:to_do_app/app/screen/complete_task/widgets/complete_task_card_widget.dart';
import 'package:to_do_app/app/screen/complete_task/widgets/complete_task_efficiency_circle_widget.dart';
import '../../models/to_do_model.dart';
import '../../values/colors.dart';

class CompleteTaskScreen extends StatelessWidget {
  const CompleteTaskScreen(
      {super.key, required this.doneList, required this.todoList});
  final List<TodoModel> doneList;
  final List<TodoModel> todoList;

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
              CompleteTaskEfficiencyCircleWidget(
                doneList: doneList,
                todoList: todoList,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Complete Tasks",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              CompleteTaskCardWidget(doneList: doneList)
            ],
          ),
        ),
      ),
    );
  }
}
