import 'package:flutter/material.dart';
import 'package:biv_manager/presentation/widgets/base_page.dart';

/// Reports page that shows various reports and analytics
class ReportsPage extends BasePage {
  /// Constructor
  const ReportsPage({super.key});

  @override
  String get pageTitle => 'Reports';

  @override
  Widget buildContent(BuildContext context) {
    return const Center(
      child: Text('Reports Page'),
    );
  }
}
