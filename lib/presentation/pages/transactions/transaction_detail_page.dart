import 'package:flutter/material.dart';
import 'package:biv_manager/presentation/widgets/base_page.dart';

/// Transaction detail page that shows transaction information
class TransactionDetailPage extends BasePage {
  /// Transaction ID
  final String transactionId;

  /// Constructor
  const TransactionDetailPage({
    super.key,
    required this.transactionId,
  });

  @override
  String get pageTitle => 'Transaction Details';

  @override
  Widget buildContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Transaction Detail Page - ID: $transactionId'),
        ],
      ),
    );
  }
}
