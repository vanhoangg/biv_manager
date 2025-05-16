import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:biv_manager/core/constants/app_constants.dart';
import 'package:biv_manager/presentation/widgets/base_page.dart';
import 'package:biv_manager/presentation/widgets/custom_app_bar.dart';

/// Transactions page that shows list of transactions
class TransactionsPage extends BasePage {
  /// Constructor
  const TransactionsPage({super.key});

  @override
  String get pageTitle => 'Transactions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Transactions'),
      body: Center(
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
      ),
    );
  }
}
