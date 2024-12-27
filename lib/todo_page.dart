import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/todo_item.dart';
import 'package:flutter_todo_app/todo_list.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);
    final todoListNotifier = ref.read(todoListProvider.notifier);

    final controller = TextEditingController();
    const gap = 20.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Enter your todo'),
                controller: controller,
                onSubmitted: (value) {
                  todoListNotifier.add(value);
                },
              ),
            ),
            const SizedBox(height: gap),
            Expanded(
              child: todoList.isEmpty
                  ? const Text('No task added yet.')
                  : ListView.builder(
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                        return TodoItem(
                          todoTitle: todoList[index],
                          onDelete: () {
                            todoListNotifier.remove(index);
                          },
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
