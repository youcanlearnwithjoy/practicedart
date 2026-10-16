import 'package:flutter/material.dart';

class KeysDemo extends StatefulWidget {
  const KeysDemo({super.key});

  @override
  State<KeysDemo> createState() => _KeysDemoState();
}

class _KeysDemoState extends State<KeysDemo> {
  List<TodoItem> listWithoutKeys = [
    TodoItem(id: 101, title: 'Learn Dart'),
    TodoItem(id: 102, title: 'Learn Flutter'),
    TodoItem(id: 103, title: 'Learn State Management'),
    TodoItem(id: 104, title: 'Learn Design Patterns'),
    TodoItem(id: 105, title: 'Learn System Design')
  ];
  List<TodoItem> listWithKeys = [
    TodoItem(id: 101, title: 'Learn Dart'),
    TodoItem(id: 102, title: 'Learn Flutter'),
    TodoItem(id: 103, title: 'Learn State Management'),
    TodoItem(id: 104, title: 'Learn Design Patterns'),
    TodoItem(id: 105, title: 'Learn System Design')
  ];

  void shuffleLists(){
    setState(() {
      listWithoutKeys.shuffle();
      listWithKeys.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Value Key Demonstration'),
        actions: [
          IconButton(onPressed: shuffleLists, icon: Icon(Icons.shuffle),
          tooltip: 'Shuffle Both Lists',)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
            'Instructions:'
            )
          ],
        )
        ),

      ),
    );
  }
}

class TodoItem({required final int id, required final String title});


