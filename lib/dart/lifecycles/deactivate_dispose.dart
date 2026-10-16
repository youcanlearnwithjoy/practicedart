import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: DeactivateVSDisposeDemo()));
}

// GlobalKey allows us to move a StatefulWidget across the widget tree
final GlobalKey<_TrackedWidgetState> trackedKey = GlobalKey<_TrackedWidgetState>();

class DeactivateVSDisposeDemo extends StatefulWidget {
  const DeactivateVSDisposeDemo({super.key});

  @override
  State<DeactivateVSDisposeDemo> createState() => _DeactivateVSDisposeDemoState();
}

class _DeactivateVSDisposeDemoState extends State<DeactivateVSDisposeDemo> {
  bool _isMountedInTop = true;
  bool _existsInTree = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deactivate vs Dispose')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _existsInTree
                      ? () => setState(() => _isMountedInTop = !_isMountedInTop)
                      : null,
                  child: const Text('Move Tree Position'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade100),
                  onPressed: () => setState(() => _existsInTree = !_existsInTree),
                  child: Text(_existsInTree ? 'Destroy Widget' : 'Recreate Widget'),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Target Container 1
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.blue.shade50,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Container A', style: TextStyle(fontWeight: FontWeight.bold)),
                  if (_existsInTree && _isMountedInTop)
                    TrackedWidget(key: trackedKey),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Target Container 2
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.green.shade50,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Container B', style: TextStyle(fontWeight: FontWeight.bold)),
                  if (_existsInTree && !_isMountedInTop)
                    TrackedWidget(key: trackedKey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrackedWidget extends StatefulWidget {
  const TrackedWidget({super.key});

  @override
  State<TrackedWidget> createState() => _TrackedWidgetState();
}

class _TrackedWidgetState extends State<TrackedWidget> {
  @override
  void initState() {
    super.initState();
    debugPrint('➡️ initState() -> Widget Created');
  }

  @override
  void deactivate() {
    debugPrint('⏸️ deactivate() -> Detached from tree (could be temporary)');
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint('💀 dispose() -> Permanently destroyed!');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      color: Colors.orange.shade200,
      child: const Text('Active Tracked Widget'),
    );
  }
}