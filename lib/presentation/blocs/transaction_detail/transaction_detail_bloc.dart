import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/transaction_repository.dart';
import 'transaction_detail_state.dart';

/// Transaction detail events
abstract class TransactionDetailEvent extends Equatable {
  /// Constructor
  const TransactionDetailEvent();

  @override
  List<Object?> get props => [];
}

/// Load transaction detail event
class LoadTransactionDetail extends TransactionDetailEvent {
  /// Transaction ID
  final String transactionId;

  /// Constructor
  const LoadTransactionDetail({
    required this.transactionId,
  });

  @override
  List<Object?> get props => [transactionId];
}

/// Transaction detail bloc
class TransactionDetailBloc
    extends Bloc<TransactionDetailEvent, TransactionDetailState> {
  /// Transaction repository
  final TransactionRepository repository;

  /// Constructor
  TransactionDetailBloc({
    required this.repository,
  }) : super(const TransactionDetailInitial()) {
    on<LoadTransactionDetail>(_onLoadTransactionDetail);
  }

  Future<void> _onLoadTransactionDetail(
    LoadTransactionDetail event,
    Emitter<TransactionDetailState> emit,
  ) async {
    try {
      emit(const TransactionDetailLoading());
      final transaction = await repository.getTransaction(event.transactionId);
      emit(TransactionDetailLoaded(transaction));
    } catch (e) {
      emit(TransactionDetailError(e.toString()));
    }
  }
}
