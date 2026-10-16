import 'package:flutter/material.dart';

class PreferredSizeWidget extends StatelessWidget {
  const PreferredSizeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(80), child:
      Container(
        height: 120,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Colors.redAccent,
            Colors.orangeAccent
          ])
        ),
        child: SafeArea(child:
        ListTile(
          title: const Text('Flutter Mapp'),
          trailing: IconButton(onPressed: (){}, icon: const Icon(
            Icons.search, size: 20,
          ),
          color: Colors.white,),
        )),
      )),
    );
  }
}
