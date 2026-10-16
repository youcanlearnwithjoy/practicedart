import 'package:flutter/material.dart';

class ResponsiveDemoScreen extends StatelessWidget {
  const ResponsiveDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🌍 1. MEDIAQUERY: Determine overall device size
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 800;

    return Scaffold(
      appBar: AppBar(title: Text('MediaQuery vs LayoutBuilder')),
      body: Row(
        children: [
          // If desktop, show a fixed navigation sidebar
          if (isDesktop)
            Container(
              width: 200,
              color: Colors.blueGrey.shade100,
              child: const Center(child: Text('Sidebar')),
            ),

          // Main Content Area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Full Screen Width: ${screenSize.width.toStringAsFixed(0)}px',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // 🏠 2. LAYOUTBUILDER: Adapt based ONLY on available parent space
                  LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      // Check width of THIS specific container (not the full screen!)
                      final availableWidth = constraints.maxWidth;

                      return Container(
                        padding: const EdgeInsets.all(16),
                        color: Colors.amber.shade100,
                        child: Column(
                          children: [
                            Text('Available Card Width: ${availableWidth.toStringAsFixed(0)}px'),
                            const SizedBox(height: 10),

                            // Switch inner layout based on local container constraints
                            if (availableWidth > 400)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const [
                                  ElevatedButton(onPressed: null, child: Text('Action 1')),
                                  ElevatedButton(onPressed: null, child: Text('Action 2')),
                                ],
                              )
                            else
                              Column(
                                children: const [
                                  ElevatedButton(onPressed: null, child: Text('Action 1')),
                                  SizedBox(height: 8),
                                  ElevatedButton(onPressed: null, child: Text('Action 2')),
                                ],
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}