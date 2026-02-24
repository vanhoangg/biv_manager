import '../../../domain/entities/customer_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/index.dart';
import '../../blocs/customer/customer_bloc.dart';
import '../../blocs/customer/customer_event.dart';
import '../../blocs/customer/customer_state.dart';
import '../../widgets/customer_form_dialog.dart';

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
  void initState() {
    super.initState();
    context.read<CustomerBloc>().add(LoadCustomerById(widget.customerId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.pageTitle,
        actions: [
          BlocBuilder<CustomerBloc, CustomerState>(
            builder: (context, state) {
              if (state is CustomerLoaded && state.customers.isNotEmpty) {
                return IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showEditCustomerDialog(
                    context,
                    state.customers.first,
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: BlocBuilder<CustomerBloc, CustomerState>(
        builder: (context, state) {
          if (state is CustomerLoading) {
            return const CustomLoading();
          }

          if (state is CustomerError) {
            return CustomError(
              message: state.message,
              onRetry: () {
                context
                    .read<CustomerBloc>()
                    .add(LoadCustomerById(widget.customerId));
              },
            );
          }

          if (state is CustomerLoaded && state.customers.isNotEmpty) {
            final customer = state.customers.first;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                child: Text(
                                  customer.name[0].toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 24,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      customer.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      customer.email,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      customer.phone,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _buildInfoRow('Type', customer.type),
                          const SizedBox(height: 8),
                          _buildInfoRow('Status', customer.status),
                          const SizedBox(height: 8),
                          _buildInfoRow('Address', customer.address ?? 'N/A'),
                          const SizedBox(height: 8),
                          _buildInfoRow(
                              'Created', _formatDate(customer.createdAt)),
                          const SizedBox(height: 8),
                          _buildInfoRow(
                              'Updated', _formatDate(customer.updatedAt)),
                          if (customer.notes != null &&
                              customer.notes!.isNotEmpty) ...[
                            const SizedBox(height: 16),
                            Text(
                              'Notes',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              customer.notes!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return const Center(
            child: Text('Customer not found'),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showEditCustomerDialog(BuildContext context, CustomerEntity customer) {
    showDialog(
      context: context,
      builder: (context) => CustomerFormDialog(customer: customer),
    );
  }
}
