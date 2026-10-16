import 'package:flutter/material.dart';

class MaterialBannerEx extends StatelessWidget {
  const MaterialBannerEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(onPressed: () {
          ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(
              padding: EdgeInsets.all(20),
              leading: const Icon(Icons.notifications_active_outlined),
              elevation: 5,
              backgroundColor: Colors.white12,
              content: const Text('Subscribe'),
              actions: <Widget>[
                TextButton(onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                }, child: const Text('Dismiss'))
              ],)
          );
      
        }, child: const Text('Open')),
      ),
    );
  }
}
