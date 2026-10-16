// ==========================================
// 3. VIEW LAYER: Pure Observer Widget
// ==========================================
import 'package:companion/dart/mvvm/user_uistate.dart';
import 'package:companion/dart/mvvm/user_viewmodel.dart';
import 'package:flutter/material.dart';

class UserProfileMvvmView extends StatelessWidget {
  final UserViewmodel viewModel;

  const UserProfileMvvmView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    // Subscribes to the ViewModel stream automatically
    return ValueListenableBuilder<UserUIState>(
      valueListenable: viewModel,
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('MVVM Execution Flow')),
          body: Center(
            child: () {
              if (state.isLoading) {
                return const CircularProgressIndicator();
              }
              if (state.errorMessage != null) {
                return Text('Error: ${state.errorMessage}');
              }
              if (state.user != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('User: ${state.user!.userName}'),
                    Text('Status: ${state.user!.isSubscribed ? "Pro Subscriber" : "Free Plan"}'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: viewModel.toggleSubscription,
                      child: const Text('Toggle Subscription'),
                    ),
                  ],
                );
              }
              return ElevatedButton(
                onPressed: viewModel.loadProfile,
                child: const Text('Load Profile'),
              );
            }(),
          ),
        );
      },
    );
  }
}