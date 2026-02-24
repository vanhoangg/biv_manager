/// Transaction module exports
///
/// This file exports all public files from the transaction module
/// to enable easy importing from other modules.
library;

// Domain layer
export 'domain/entities/transaction_entity.dart';
export 'domain/repositories/transaction_repository.dart';
export 'domain/usecases/transaction/get_transactions_usecase.dart';
export 'domain/usecases/transaction/get_transaction_by_id_usecase.dart';
export 'domain/usecases/transaction/create_transaction_usecase.dart';
export 'domain/usecases/transaction/update_transaction_usecase.dart';
export 'domain/usecases/transaction/delete_transaction_usecase.dart';
export 'domain/usecases/transaction/get_transactions_by_date_range_usecase.dart';
export 'domain/usecases/transaction/get_transactions_by_customer_usecase.dart';
export 'domain/usecases/transaction/get_total_amount_by_date_range_usecase.dart';
export 'domain/usecases/transaction/get_total_amount_by_customer_usecase.dart';

// Data layer
export 'data/models/transaction_dto.dart';
export 'data/repositories/transaction_repository_impl.dart';
export 'data/datasources/transaction/transaction_local_data_source.dart';
export 'data/datasources/transaction/transaction_remote_data_source.dart';
export 'di/transaction_module.dart';

// Presentation layer
export 'presentation/blocs/transaction/transaction_bloc.dart';
export 'presentation/blocs/transaction/transaction_event.dart';
export 'presentation/blocs/transaction/transaction_state.dart';
export 'presentation/blocs/transaction_detail/transaction_detail_bloc.dart';
export 'presentation/blocs/transaction_detail/transaction_detail_state.dart';
export 'presentation/pages/transactions/transactions_page.dart';
export 'presentation/pages/transactions/transaction_detail_page.dart';
export 'presentation/widgets/transaction_form_dialog.dart';
export 'presentation/widgets/transaction_list_item.dart';
