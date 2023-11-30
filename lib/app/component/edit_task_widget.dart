import 'package:flutter/material.dart';
import 'package:to_do_app/app/config/to_do_list.dart';
import '../models/to_do_model.dart';

class EditTaskWidget extends StatefulWidget {
  const EditTaskWidget({super.key, required this.todo});

  final TodoModel todo;

  @override
  State<EditTaskWidget> createState() => _EditTaskWidgetState();
}

class _EditTaskWidgetState extends State<EditTaskWidget> {
  final _formKey = GlobalKey<FormState>();

  final today = DateTime.now();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    _titleController.text = widget.todo.title;
    _descriptionController.text = widget.todo.description;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Edit Task",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Task',
                  labelStyle: TextStyle(color: Colors.blue),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter task title';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(color: Colors.blue),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), //
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), //
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter task description.';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(
                    const BeveledRectangleBorder(
                        borderRadius: BorderRadius.zero),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final now = DateTime.now();
                    final newTodo = TodoModel(
                        _titleController.text,
                        _descriptionController.text,
                        '${today.day}/${today.month}/${today.year}',
                        '${now.hour} : ${now.minute}');

                    TodoList.editTodo(newTodo);
                    Navigator.pop(context, widget.todo);
                  }
                },
                child: const Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
