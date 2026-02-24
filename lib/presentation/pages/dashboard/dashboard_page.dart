import 'package:flutter/material.dart';
import 'package:shared/index.dart';

/// Dashboard page that shows overview of the app
class DashboardPage extends BasePage {
  /// Constructor
  const DashboardPage({super.key});

  @override
  String get pageTitle => 'Dashboard';

  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends BaseState<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.pageTitle,
      ),
      body: const Center(
        child: Text('Dashboard Page'),
      ),
    );
  }
}
