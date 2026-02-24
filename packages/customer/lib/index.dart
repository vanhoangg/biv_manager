/// Customer module exports
///
/// This file exports all public files from the customer module
/// to enable easy importing from other modules.
library;

// Domain layer
export 'domain/entities/customer_entity.dart';
export 'domain/repositories/customer_repository.dart';
export 'domain/usecases/customer/get_customers_usecase.dart';
export 'domain/usecases/customer/get_customer_by_id_usecase.dart';
export 'domain/usecases/customer/create_customer_usecase.dart';
export 'domain/usecases/customer/update_customer_usecase.dart';
export 'domain/usecases/customer/delete_customer_usecase.dart';
export 'domain/usecases/customer/search_customers_usecase.dart';
export 'domain/usecases/customer/get_customers_by_status_usecase.dart';
export 'domain/usecases/customer/get_customers_by_type_usecase.dart';

// Data layer
export 'data/models/customer_dto.dart';
export 'data/repositories/customer_repository_impl.dart';

// Presentation layer
export 'presentation/blocs/customer/customer_bloc.dart';
export 'presentation/blocs/customer/customer_event.dart';
export 'presentation/blocs/customer/customer_state.dart';
export 'presentation/pages/customers/customers_page.dart';
export 'presentation/pages/customers/customer_detail_page.dart';
export 'presentation/widgets/customer_form_dialog.dart';
export 'presentation/widgets/customer_list_item.dart';
