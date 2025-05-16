import 'package:flutter/material.dart';
import 'package:biv_manager/presentation/widgets/base_page.dart';

/// Customer detail page that shows customer information
class CustomerDetailPage extends BasePage {
  /// Customer ID
  final String customerId;

  /// Constructor
  const CustomerDetailPage({
    super.key,
    required this.customerId,
  });

  @override
  String get pageTitle => 'Customer Details';

  @override
  Widget buildContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Customer Detail Page - ID: $customerId'),
        ],
      ),
    );
  }
}
