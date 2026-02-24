import 'package:flutter/material.dart';

import 'package:shared/index.dart';

/// Reports page that shows various reports and analytics
class ReportsPage extends BasePage {
  /// Constructor
  const ReportsPage({super.key});

  @override
  String get pageTitle => 'Reports';

  @override
  State<StatefulWidget> createState() => _ReportPageState();
}

class _ReportPageState extends BaseState<ReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.pageTitle,
      ),
      body: const Center(
        child: Text('Reports Page'),
      ),
    );
  }
}
