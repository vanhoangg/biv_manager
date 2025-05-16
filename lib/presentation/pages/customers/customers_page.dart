import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:biv_manager/core/constants/app_constants.dart';
import 'package:biv_manager/presentation/widgets/base_page.dart';

/// Customers page that shows list of customers
class CustomersPage extends BasePage {
  /// Constructor
  const CustomersPage({super.key});

  @override
  String get pageTitle => 'Customers';

  @override
  Widget buildContent(BuildContext context) {
    return Center(
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
    );
  }
}
