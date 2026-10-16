import 'package:companion/mvc/controller_ex.dart';
import 'package:flutter/material.dart';

class UserProfileMVCView extends StatefulWidget {
  const UserProfileMVCView({super.key});

  @override
  State<UserProfileMVCView> createState() => _UserProfileMVCViewState();
}

class _UserProfileMVCViewState extends State<UserProfileMVCView> {
  final UserController _controller = UserController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MVC Execution Flow'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User: ${_controller.userName}'),
            Text('Points: ${_controller.userPoints}'),
            Text('VIP Status: ${_controller.isVip}'),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              _controller.addBonusPoints(onStateChanged: (){
                setState(() {
                });
              });
            },
                child: const Text('Add 30 Points'))
          ],
        ),
      ),
    );
  }
}
