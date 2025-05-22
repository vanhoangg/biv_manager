import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/index.dart';

/// Transactions page that shows list of transactions
class TransactionsPage extends BasePage {
  /// Constructor
  const TransactionsPage({super.key});

  @override
  String get pageTitle => 'Transactions';

  @override
  State<StatefulWidget> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends BaseState<TransactionsPage> {
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
