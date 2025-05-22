import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/index.dart';

/// Profile page that shows user information
class ProfilePage extends BasePage {
  /// Constructor
  const ProfilePage({super.key});

  @override
  String get pageTitle => 'Profile';

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.pageTitle,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile Page'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go(AppConstants.routes.login),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
