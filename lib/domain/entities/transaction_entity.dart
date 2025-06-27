import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

/// Entity representing a transaction
class TransactionEntity extends Equatable {
  /// Transaction ID
  final String id;

  /// Transaction title
  final String title;

  /// Transaction description
  final String description;

  /// Transaction amount
  final double amount;

  /// Transaction type (income/expense)
  final String type;

  /// Transaction category
  final String category;

  /// Transaction status
  final String status;

  /// Transaction date
  final DateTime date;

  /// Reference number
  final String? referenceNumber;

  /// Notes
  final String? notes;

  /// Customer ID
  final String customerId;

  /// Payment method
  final String paymentMethod;

  /// Created at timestamp
  final DateTime createdAt;

  /// Updated at timestamp
  final DateTime updatedAt;

  /// Constructor
  const TransactionEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.type,
    required this.category,
    required this.status,
    this.referenceNumber,
    this.notes,
    required this.date,
    required this.customerId,
    required this.paymentMethod,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Create a copy of this entity with the given fields replaced with the new values
  TransactionEntity copyWith({
    String? id,
    String? title,
    String? description,
    double? amount,
    String? type,
    String? category,
    String? status,
    String? referenceNumber,
    String? notes,
    DateTime? date,
    String? customerId,
    String? paymentMethod,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TransactionEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      category: category ?? this.category,
      status: status ?? this.status,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      notes: notes ?? this.notes,
      date: date ?? this.date,
      customerId: customerId ?? this.customerId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'amount': amount,
      'type': type,
      'category': category,
      'status': status,
      'referenceNumber': referenceNumber,
      'notes': notes,
      'date': Timestamp.fromDate(date),
      'customerId': customerId,
      'paymentMethod': paymentMethod,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  factory TransactionEntity.fromJson(Map<String, dynamic> json) {
    return TransactionEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      amount: (json['amount'] as num).toDouble(),
      type: json['type'] as String,
      category: json['category'] as String,
      status: json['status'] as String,
      referenceNumber: json['referenceNumber'] as String?,
      notes: json['notes'] as String?,
      date: (json['date'] as Timestamp).toDate(),
      customerId: json['customerId'] as String,
      paymentMethod: json['paymentMethod'] as String,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        amount,
        type,
        category,
        status,
        referenceNumber,
        notes,
        date,
        customerId,
        paymentMethod,
        createdAt,
        updatedAt,
      ];
}
