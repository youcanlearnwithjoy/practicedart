import 'package:flutter/material.dart';

class IsolatedRepaintExample extends StatelessWidget {
  const IsolatedRepaintExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row( 
        children: [
          // 1. Heavy Static Content
          Expanded(
            child: ListView.builder(
              itemCount: 500,
              itemBuilder: (context, index) => ListTile(
                title: Text('Complex Item $index'),
                subtitle: const Text('Detailed metadata requiring paint operations'),
              ),
            ),
          ),

          // 2. Continuous Animation isolated with RepaintBoundary
          const RepaintBoundary( // 👈 Prevents animation paint calls from dirtying the ListView
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}