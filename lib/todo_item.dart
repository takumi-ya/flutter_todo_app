import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String todoTitle;

  const TodoItem({
    super.key,
    required this.todoTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(todoTitle),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
