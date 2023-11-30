import 'package:flutter/material.dart';
import 'package:to_do_app/app/values/colors.dart';
import '../../../component/edit_task_widget.dart';
import '../../../models/to_do_model.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({
    super.key,
    required this.todoList,
    required this.onTodoDone,
    required this.onTodoDelete,
    required this.onTodoEdit,
  });

  final List<TodoModel> todoList;
  final Function(TodoModel) onTodoDone;
  final Function(TodoModel) onTodoDelete;
  final Function(TodoModel) onTodoEdit;

  @override
  Widget build(BuildContext context) {
    if (todoList.isEmpty) {
      return const Column(
        children: [
          SizedBox(
            height: 108,
          ),
          Center(
              child: Text(
            "Please create a task.",
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 28),
          ))
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
            itemCount: todoList.length,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              TodoModel todoModel = todoList[index];
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              todoModel.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              buildShowDialog(context, todoModel);
                            },
                            icon: const Icon(
                              Icons.delete_forever,
                              size: 18,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        todoModel.description,
                        style: const TextStyle(color: Colors.black87),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        todoModel.date,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            todoModel.time,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  final returnVal = await showModalBottomSheet(
                                      context: context,
                                      builder: (context) => EditTaskWidget(
                                            todo: todoModel,
                                          ));

                                  if (returnVal != null) {
                                    onTodoEdit(returnVal as TodoModel);
                                  }
                                },
                                child: const Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  onTodoDone(todoModel);
                                },
                                child: const Icon(
                                  Icons.task_alt,
                                  size: 18,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      );
    }
  }

  Future<dynamic> buildShowDialog(BuildContext context, TodoModel todoModel) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Alert Dialog'),
          content: const Text('Are you sure to delete this task?'),
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () {
                onTodoDelete(todoModel);
                Navigator.of(context).pop();
              },
              child: const Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(bgColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}
