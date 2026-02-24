import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/customer_entity.dart';
import '../blocs/customer/customer_bloc.dart';
import '../blocs/customer/customer_event.dart';
import 'customer_form_dialog.dart';

/// List item for displaying customer information
class CustomerListItem extends StatelessWidget {
  /// Customer to display
  final CustomerEntity customer;

  /// Constructor
  const CustomerListItem({
    super.key,
    required this.customer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(customer.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(customer.email),
            Text(customer.phone),
            Row(
              children: [
                Chip(
                  label: Text(customer.type),
                  backgroundColor: customer.type == 'business'
                      ? Colors.blue.withOpacity(0.2)
                      : Colors.green.withOpacity(0.2),
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(customer.status),
                  backgroundColor: customer.status == 'active'
                      ? Colors.green.withOpacity(0.2)
                      : Colors.red.withOpacity(0.2),
                ),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => CustomerFormDialog(customer: customer),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Delete Customer'),
                    content: Text(
                        'Are you sure you want to delete ${customer.name}?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<CustomerBloc>()
                              .add(DeleteCustomer(customer.id));
                          Navigator.pop(context);
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
