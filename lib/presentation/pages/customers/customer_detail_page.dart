import 'package:flutter/material.dart';

import '../../../shared/index.dart';

/// Customer detail page that shows customer information
class CustomerDetailPage extends BaseStatefulWidget {
  /// Customer ID
  final String customerId;

  /// Constructor
  const CustomerDetailPage({
    super.key,
    required this.customerId,
  });

  String get pageTitle => 'Customer Details';

  @override
  State<StatefulWidget> createState() => _CustomerDetailPageState();
}

class _CustomerDetailPageState extends BaseState<CustomerDetailPage> {
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
            Text('Customer Detail Page - ID: $widget.customerId'),
          ],
        ),
      ),
    );
  }
}
