import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: KeyDemonstrationApp()));
}

class KeyDemonstrationApp extends StatefulWidget {
  const KeyDemonstrationApp({super.key});

  @override
  State<KeyDemonstrationApp> createState() => _KeyDemonstrationAppState();
}

class _KeyDemonstrationAppState extends State<KeyDemonstrationApp> {
  // GlobalKey used to access FormState from outside the Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // List of items with internal checkbox state
  List<String> _items = ['Item A', 'Item B', 'Item C'];

  void _swapItems() {
    setState(() {
      // Swap first two items
      final temp = _items[0];
      _items[0] = _items[1];
      _items[1] = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Keys Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. LocalKey (ValueKey) Demo: Swapping Stateful Items',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text('Without ValueKeys, checkbox state wouldn\'t move with swapped labels!'),
            const SizedBox(height: 10),

            // Render list of stateful items WITH ValueKey
            Column(
              children: _items
                  .map((item) => StatefulListItem(
                // Key ensures state stays attached to correct label!
                key: ValueKey(item),
                title: item,
              ))
                  .toList(),
            ),
            ElevatedButton(
              onPressed: _swapItems,
              child: const Text('Swap Item A & Item B'),
            ),

            const Divider(height: 40, thickness: 2),

            const Text(
              '2. GlobalKey Demo: Accessing State remotely',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Form using GlobalKey
            Form(
              key: _formKey,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Enter Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Access FormState directly through GlobalKey
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form Validated Successfully!')),
                  );
                }
              },
              child: const Text('Validate Form via GlobalKey'),
            ),
          ],
        ),
      ),
    );
  }
}

// Stateful item that holds internal selection state
class StatefulListItem extends StatefulWidget {
  final String title;

  const StatefulListItem({super.key, required this.title});

  @override
  State<StatefulListItem> createState() => _StatefulListItemState();
}

class _StatefulListItemState extends State<StatefulListItem> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _checked ? Colors.green.shade100 : Colors.grey.shade100,
      child: ListTile(
        title: Text(widget.title),
        trailing: Checkbox(
          value: _checked,
          onChanged: (val) {
            setState(() {
              _checked = val ?? false;
            });
          },
        ),
      ),
    );
  }
}