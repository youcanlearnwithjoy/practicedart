import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          showModalBottomSheet(context: context, builder: (context) {
            return SizedBox(height: 400,
              child: Center(
                child: ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: const Text('Close')),
              ),
            );
          },);
        }, child: const Text('Modal Bottom Sheet')),
      ),
    );
  }
}
