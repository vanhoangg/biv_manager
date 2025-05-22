import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/index.dart';

/// Customers page that shows list of customers
class CustomersPage extends BaseStatefulWidget {
  /// Constructor
  const CustomersPage({super.key});

  String get pageTitle => 'Customers';

  @override
  State<StatefulWidget> createState() => _CustomersPageState();
}

class _CustomersPageState extends BaseState<CustomersPage> {
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
            const Text('Customers Page'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push('${AppConstants.routeCustomers}/1'),
              child: const Text('View Customer Details'),
            ),
          ],
        ),
      ),
    );
  }
}
