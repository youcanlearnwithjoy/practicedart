import 'package:flutter/material.dart';

class StatusRowExample extends StatelessWidget {
  final String statusMessage = 'Connected to remote database server';

  const StatusRowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expanded vs Flexible')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('1. Using Expanded (FlexFit.tight)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            // EXAMPLES WITH EXPANDED
            buildRowWithExpanded('Short text'),
            const SizedBox(height: 8),
            buildRowWithExpanded(statusMessage),

            const Divider(height: 32),

            const Text('2. Using Flexible (FlexFit.loose)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            // EXAMPLES WITH FLEXIBLE
            buildRowWithFlexible('Short text'),
            const SizedBox(height: 8),
            buildRowWithFlexible(statusMessage),
          ],
        ),
      ),
    );
  }

  // 🔴 EXPANDED ROW
  Widget buildRowWithExpanded(String text) {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const Icon(Icons.info, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              color: Colors.amber.shade200, // Background highlights filled space
              child: Text(text, style: const TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(width: 8),
          Chip(label: Text('ACTIVE', style: TextStyle(fontSize: 10))),
        ],
      ),
    );
  }

  // 🟢 FLEXIBLE ROW
  Widget buildRowWithFlexible(String text) {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const Icon(Icons.info, color: Colors.blue),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              color: Colors.amber.shade200, // Background highlights filled space
              child: Text(text, style: const TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(width: 8),
          Chip(label: Text('ACTIVE', style: TextStyle(fontSize: 10))),
        ],
      ),
    );
  }
}