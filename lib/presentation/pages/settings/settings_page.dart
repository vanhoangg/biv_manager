import 'package:flutter/material.dart';
import 'package:biv_manager/presentation/widgets/base_page.dart';

/// Settings page for app configuration
class SettingsPage extends BasePage {
  /// Constructor
  const SettingsPage({super.key});

  @override
  String get pageTitle => 'Settings';

  @override
  Widget buildContent(BuildContext context) {
    return const Center(
      child: Text('Settings Page'),
    );
  }
}
