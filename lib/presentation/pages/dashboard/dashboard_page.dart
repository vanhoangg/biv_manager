import 'package:flutter/material.dart';
import 'package:biv_manager/presentation/widgets/base_page.dart';

/// Dashboard page that shows overview of the app
class DashboardPage extends BasePage {
  /// Constructor
  const DashboardPage({super.key});

  @override
  String get pageTitle => 'Dashboard';

  @override
  Widget buildContent(BuildContext context) {
    return const Center(
      child: Text('Dashboard Page'),
    );
  }
}
