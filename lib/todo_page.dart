import 'package:flutter/material.dart';
import 'package:flutter_todo_app/todo_item.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key, required this.title});

  final String title;

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _todoList = <String>[];
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const gap = 20.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Enter your todo'),
                controller: _controller,
                onSubmitted: (value) {},
              ),
            ),
            const SizedBox(height: gap),
            Expanded(
              child: _todoList.isEmpty
                  ? const Text('No task added yet.')
                  : ListView.builder(
                      itemCount: _todoList.length,
                      itemBuilder: (context, index) {
                        return TodoItem(todoTitle: _todoList[index]);
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
