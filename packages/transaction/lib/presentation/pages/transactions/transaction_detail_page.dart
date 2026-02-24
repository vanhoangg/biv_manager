import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/index.dart';
import '../../../domain/entities/transaction_entity.dart';
import '../../blocs/transaction_detail/transaction_detail_bloc.dart';
import '../../blocs/transaction_detail/transaction_detail_state.dart';

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
  State<StatefulWidget> createState() => _TransactionDetailPageState();
}

class _TransactionDetailPageState extends BaseState<TransactionDetailPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.pageTitle,
      ),
      body: BlocBuilder<TransactionDetailBloc, TransactionDetailState>(
        builder: (context, state) {
          if (state is TransactionDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is TransactionDetailError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.message,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<TransactionDetailBloc>().add(
                            LoadTransactionDetail(
                              transactionId: widget.transactionId,
                            ),
                          );
                    },
                    child: Text(l10n.retry),
                  ),
                ],
              ),
            );
          }

          if (state is TransactionDetailLoaded) {
            return _buildTransactionDetails(context, state.transaction);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildTransactionDetails(
      BuildContext context, TransactionEntity transaction) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAmountSection(context, transaction),
          const SizedBox(height: 24),
          _buildDetailsSection(context, transaction),
          const SizedBox(height: 24),
          _buildDescriptionSection(context, transaction),
        ],
      ),
    );
  }

  Widget _buildAmountSection(
      BuildContext context, TransactionEntity transaction) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withAlpha(26),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            LocaleFormatter.formatCurrency(context, transaction.amount),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            transaction.type.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSection(
      BuildContext context, TransactionEntity transaction) {
    final l10n = l10nOf(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withAlpha(26),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.details,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildDetailRow(
            context,
            l10n.date,
            LocaleFormatter.formatDateTime(context, transaction.date),
          ),
          const SizedBox(height: 12),
          _buildDetailRow(
            context,
            l10n.status,
            transaction.status.toUpperCase(),
          ),
          const SizedBox(height: 12),
          _buildDetailRow(
            context,
            l10n.category,
            transaction.category,
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(
      BuildContext context, TransactionEntity transaction) {
    final l10n = l10nOf(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withAlpha(26),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.description,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Text(
            transaction.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(153),
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
