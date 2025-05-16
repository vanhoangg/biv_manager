import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:biv_manager/core/constants/app_constants.dart';
import 'package:biv_manager/presentation/widgets/base_page.dart';

/// Transactions page that shows list of transactions
class TransactionsPage extends BasePage {
  /// Constructor
  const TransactionsPage({super.key});

  @override
  String get pageTitle => 'Transactions';

  @override
  Widget buildContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Transactions Page'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () =>
                context.push('${AppConstants.routeTransactions}/1'),
            child: const Text('View Transaction Details'),
          ),
        ],
      ),
    );
  }
}
