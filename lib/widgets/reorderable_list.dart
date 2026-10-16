import 'package:flutter/material.dart';

class ReOrderableListviewWidget extends StatefulWidget {
  const ReOrderableListviewWidget({super.key});

  @override
  State<ReOrderableListviewWidget> createState() => _ReOrderableListviewWidgetState();
}

class _ReOrderableListviewWidgetState extends State<ReOrderableListviewWidget> {
  final List<int> items = List<int>.generate(30, (int index)=> index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ReorderableListView(
            children: List.generate(items.length, (index) =>
            ListTile(key: Key('$index'),
            tileColor: items[index].isOdd? Colors.white12 : Colors.white30,
              title: Text('Item ${items[index]}'),
              trailing: const Icon(Icons.drag_handle_sharp),
            )),
          onReorderItem: (oldIndex, newIndex) {
            setState(() {
              if(oldIndex < newIndex ){
                newIndex -= 1;
              }
              final int item = items.removeAt(oldIndex);
              items.insert(newIndex, item);
            });
          },
        
        ),
      ),
    );
  }
}
