import 'package:equatable/equatable.dart';

/// Transaction entity
class TransactionEntity extends Equatable {
  /// Transaction ID
  final String id;

  /// Transaction title
  final String title;

  /// Transaction amount
  final double amount;

  /// Transaction date
  final DateTime date;

  /// Transaction status
  final String status;

  /// Transaction description
  final String? description;

  /// Transaction type
  final String type;

  /// Transaction category
  final String category;

  /// Constructor
  const TransactionEntity({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.status,
    this.description,
    required this.type,
    required this.category,
  });

  /// Create a copy of this transaction with the given fields replaced with the new values
  TransactionEntity copyWith({
    String? id,
    String? title,
    double? amount,
    DateTime? date,
    String? status,
    String? description,
    String? type,
    String? category,
  }) {
    return TransactionEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      status: status ?? this.status,
      description: description ?? this.description,
      type: type ?? this.type,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        amount,
        date,
        status,
        description,
        type,
        category,
      ];
}
