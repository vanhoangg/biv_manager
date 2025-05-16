import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:biv_manager/core/constants/app_constants.dart';
import 'package:biv_manager/presentation/widgets/base_page.dart';

/// Profile page that shows user information
class ProfilePage extends BasePage {
  /// Constructor
  const ProfilePage({super.key});

  @override
  String get pageTitle => 'Profile';

  @override
  Widget buildContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Profile Page'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.go(AppConstants.routeLogin),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
