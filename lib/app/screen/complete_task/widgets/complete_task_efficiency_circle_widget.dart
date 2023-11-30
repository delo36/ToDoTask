import 'package:flutter/material.dart';
import '../../../models/to_do_model.dart';

class CompleteTaskEfficiencyCircleWidget extends StatefulWidget {
  const CompleteTaskEfficiencyCircleWidget(
      {super.key, required this.doneList, required this.todoList});

  final List<TodoModel> doneList;
  final List<TodoModel> todoList;

  @override
  State<CompleteTaskEfficiencyCircleWidget> createState() =>
      _CompleteTaskEfficiencyCircleWidgetState();
}

class _CompleteTaskEfficiencyCircleWidgetState
    extends State<CompleteTaskEfficiencyCircleWidget> {
  double calculateEfficiency() {
    int doneListLength = widget.doneList.length;
    int totalTasks = doneListLength + widget.todoList.length;

    if (totalTasks == 0) {
      return 0.0;
    }
    return doneListLength / totalTasks;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          height: 185,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Efficiency",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: 80.0,
                      height: 80.0,
                      child: CircularProgressIndicator(
                        value: calculateEfficiency(),
                        strokeWidth: 12.0,
                        color: Colors.blue,
                        backgroundColor: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.grey,
                          size: 16,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Doing Task")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.blue,
                          size: 16,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Completed Task")
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
