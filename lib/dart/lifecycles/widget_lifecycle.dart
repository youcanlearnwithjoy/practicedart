import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: LifecycleDemoApp(),
  ));
}

class LifecycleDemoApp extends StatefulWidget {
  const LifecycleDemoApp({super.key});

  @override
  State<LifecycleDemoApp> createState() => _LifecycleDemoAppState();
}

class _LifecycleDemoAppState extends State<LifecycleDemoApp> {
  bool _showCounter = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateful Lifecycle Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_showCounter) const CounterWidget(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showCounter = !_showCounter;
                });
              },
              child: Text(_showCounter ? 'Destroy Counter Widget' : 'Create Counter Widget'),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() {
    debugPrint('1. createState() called');
    return _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    debugPrint('2. initState() called');

    // Start a timer to increment counter every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _counter++;
          debugPrint('setState() triggered -> Counter: $_counter');
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('3. didChangeDependencies() called');
  }

  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('didUpdateWidget() called');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('4. build() called');
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blue.shade50,
      child: Column(
        children: [
          const Text(
            'Active Counter:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '$_counter',
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  @override
  void deactivate() {
    debugPrint('5. deactivate() called');
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint('6. dispose() called — Cleaning up resources');
    _timer?.cancel(); // Cancel timer to avoid memory leaks
    super.dispose();
  }
}