import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:biv_manager/presentation/widgets/base_page.dart';
import 'package:biv_manager/presentation/widgets/custom_loading.dart';
import 'package:biv_manager/presentation/widgets/custom_error.dart';
import 'package:biv_manager/core/utils/locale_formatter.dart';
import 'package:biv_manager/presentation/blocs/transaction_detail/transaction_detail_bloc.dart';
import 'package:biv_manager/presentation/blocs/transaction_detail/transaction_detail_state.dart';

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
  String get pageTitle => l10n?.transactionDetails ?? 'Transaction Details';

  @override
  Widget buildContent(BuildContext context) {
    if (l10n == null) return const SizedBox.shrink();

    return BlocBuilder<TransactionDetailBloc, TransactionDetailState>(
      builder: (context, state) {
        if (state is TransactionDetailLoading) {
          return CustomLoading(message: l10n!.loadingTransactionDetails);
        }

        if (state is TransactionDetailError) {
          return CustomError(
            message: state.message,
            onRetry: () {
              context.read<TransactionDetailBloc>().add(
                    LoadTransactionDetail(transactionId: transactionId),
                  );
            },
          );
        }

        if (state is TransactionDetailLoaded) {
          final transaction = state.transaction;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  '${l10n!.amount}: ${LocaleFormatter.formatCurrency(context, transaction.amount)}',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  '${l10n!.date}: ${LocaleFormatter.formatDateTime(context, transaction.date)}',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  '${l10n!.status}: ${transaction.status}',
                  style: theme.textTheme.bodyLarge,
                ),
                if (transaction.description != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    l10n!.description,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    transaction.description!,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ],
            ),
          );
        }

        return CustomError(
          message: l10n!.failedToLoadTransactionDetails,
        );
      },
    );
  }
}
