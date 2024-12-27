import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_list.g.dart';

// dart run build_runner build

@riverpod
class TodoList extends _$TodoList {
  @override
  List<String> build() {
    return [];
  }

  void add(String todo) {
    state = [...state, todo];
  }

  void remove(int index) {
    state = List<String>.from(state)..removeAt(index);
  }
}
