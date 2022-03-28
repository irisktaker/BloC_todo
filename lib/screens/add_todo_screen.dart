import 'package:flutter/material.dart';
import 'package:todo_bloc/models/todos_model.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerId = TextEditingController();
    TextEditingController controllerTask = TextEditingController();
    TextEditingController controllerDescription = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BloC Pattern: Add a To Do",
        ),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _inputField("ID", controllerId),
              _inputField("Task", controllerTask),
              _inputField("Description", controllerDescription),
              ElevatedButton(
                onPressed: () {
                  var todo = Todo(
                      id: controllerId.text,
                      task: controllerTask.text,
                      description: controllerDescription.text);
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
                child: const Text("Add To Do"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _inputField(String field, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$field: ",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 10),
          child: TextFormField(
            controller: controller,
          ),
        ),
      ],
    );
  }
}
