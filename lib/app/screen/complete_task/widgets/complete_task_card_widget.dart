import 'package:flutter/material.dart';
import 'package:to_do_app/app/config/to_do_list.dart';
import 'package:to_do_app/app/models/to_do_model.dart';

class CompleteTaskCardWidget extends StatelessWidget {
  const CompleteTaskCardWidget({super.key, required this.doneList});

  final List<TodoModel> doneList;

  @override
  Widget build(BuildContext context) {
    if (TodoList.doneTodos.isEmpty) {
      return const Column(
        children: [
          SizedBox(
            height: 108,
          ),
          Center(
            child: Text(
              "No tasks!",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          )
        ],
      );
    } else {
      return SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
              itemCount: doneList.length,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                TodoModel todoModel = doneList[index];
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
                              onPressed: () {},
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
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      );
    }
  }
}
