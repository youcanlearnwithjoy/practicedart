import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  final List<Todo> todos = [
    Todo(id: 101, title: 'Learn Dart'),
    Todo(id: 102, title: 'Learn Flutter'),
    Todo(id: 103, title: 'Learn State Management'),
    Todo(id: 104, title: 'Learn Design Patterns'),
    Todo(id: 105, title: 'Learn System Design')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: ReorderableListView.builder(

          itemBuilder: (context, index) {
            final todo = todos[index];
            return TodoTile(todo: todo,key: ValueKey(todo.id));
          },
          itemCount: todos.length,
        onReorderItem: (oldIndex, newIndex) {
          setState(() {
            // if(newIndex > oldIndex){
            //   newIndex--;
            // }
            final item = todos.removeAt(oldIndex);
            todos.insert(newIndex, item);
          });
        },
      ),
    );
  }
}

class Todo({required var  int id, required var  String title});


class TodoTile extends StatefulWidget {
  final Todo todo;
  const TodoTile({super.key, required this.todo});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: widget.key,
      title:  Text(widget.todo.title),
      subtitle: Text('Counter: $counter'),
      trailing: IconButton(
          onPressed: (){
            setState(() {
              counter++;
            });
          },
          icon: const Icon(Icons.add)
      ),
    );
  }
}
