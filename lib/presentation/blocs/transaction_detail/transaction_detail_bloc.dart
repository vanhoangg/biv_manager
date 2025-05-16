import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:biv_manager/presentation/blocs/transaction_detail/transaction_detail_state.dart';

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
  /// Constructor
  TransactionDetailBloc() : super(const TransactionDetailLoading()) {
    on<LoadTransactionDetail>(_onLoadTransactionDetail);
  }

  Future<void> _onLoadTransactionDetail(
    LoadTransactionDetail event,
    Emitter<TransactionDetailState> emit,
  ) async {
    try {
      emit(const TransactionDetailLoading());
      // TODO: Load transaction from repository
      // final transaction = await _transactionRepository.getTransaction(event.transactionId);
      // emit(TransactionDetailLoaded(transaction));
    } catch (e) {
      emit(TransactionDetailError(e.toString()));
    }
  }
}
