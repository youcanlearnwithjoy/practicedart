import 'package:flutter/material.dart';

class IntrinsicExample extends StatelessWidget {
  const IntrinsicExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IntrinsicHeight Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight( // 👈 Forces Row children to match the tallest child's height
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretches children vertically
            children: [
              Expanded(
                child: Container(
                  color: Colors.blue.shade100,
                  padding: const EdgeInsets.all(8),
                  child: const Text('Short text.'),
                ),
              ),
              const VerticalDivider(width: 16, thickness: 2, color: Colors.grey),
              Expanded(
                child: Container(
                  color: Colors.amber.shade100,
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Longer text content that takes up multiple lines and pushes the height higher.',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}