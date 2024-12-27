import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String todoTitle;
  final Function() onDelete;

  const TodoItem({
    super.key,
    required this.todoTitle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(todoTitle == '' ? 'No title' : todoTitle),
        trailing: IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
