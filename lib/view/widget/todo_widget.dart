import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget(
      {Key? key,
      required this.deleteTodo,
      required this.tapTodo,
      required this.titleTodo,
      required this.statusTodo})
      : super(key: key);

  final Function() deleteTodo;
  final Function() tapTodo;
  final String titleTodo;
  final bool statusTodo;

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: tapTodo,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                titleTodo,
                style: TextStyle(
                  decoration: statusTodo ? TextDecoration.lineThrough : null,
                  fontSize: 20,
                  color: statusTodo ? Colors.grey : null,
                ),
              )),
              IconButton(
                  onPressed: deleteTodo, icon: const Icon(Icons.close_rounded))
            ],
          ),
        ),
      ),
    );
  }
}
