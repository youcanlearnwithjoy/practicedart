import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: DynamicListDemo()));
}

class DynamicListDemo extends StatefulWidget {
  const DynamicListDemo({super.key});

  @override
  State<DynamicListDemo> createState() => _DynamicListDemoState();
}

class _DynamicListDemoState extends State<DynamicListDemo> {
  // Data items without unique IDs
  final List<String> _items = ['First Item', 'Second Item', 'Third Item'];

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic List with UniqueKeys')),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final title = _items[index];
          return Dismissible(
            // Dismissible REQUIRE keys! UniqueKey guarantees no collision
            // even if two list strings are identical.
            key: UniqueKey(),
            onDismissed: (_) => _removeItem(index),
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text(title),
              subtitle: const Text('Swipe left or right to dismiss'),
            ),
          );
        },
      ),
    );
  }
}