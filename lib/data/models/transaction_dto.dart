/// Data Transfer Object for Transaction
library;

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/transaction_entity.dart';

class TransactionDTO {
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

  /// Transaction status (pending/completed/failed)
  final String status;

  /// Transaction date
  final DateTime date;

  /// Transaction reference number
  final String? referenceNumber;

  /// Transaction notes
  final String? notes;

  /// Customer ID
  final String customerId;

  /// Transaction payment method
  final String paymentMethod;

  /// Transaction created date
  final DateTime createdAt;

  /// Transaction updated date
  final DateTime updatedAt;

  /// Constructor
  const TransactionDTO({
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

  /// Create from Firestore
  factory TransactionDTO.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TransactionDTO(
      id: doc.id,
      title: data['title'] as String,
      description: data['description'] as String,
      amount: (data['amount'] as num).toDouble(),
      type: data['type'] as String,
      category: data['category'] as String,
      status: data['status'] as String,
      referenceNumber: data['referenceNumber'] as String?,
      notes: data['notes'] as String?,
      date: (data['date'] as Timestamp).toDate(),
      customerId: data['customerId'] as String,
      paymentMethod: data['paymentMethod'] as String,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  /// Convert to Firestore
  Map<String, dynamic> toFirestore() {
    return {
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

  /// Convert to Entity
  TransactionEntity toEntity() {
    return TransactionEntity(
      id: id,
      title: title,
      description: description,
      amount: amount,
      type: type,
      category: category,
      status: status,
      referenceNumber: referenceNumber,
      notes: notes,
      date: date,
      customerId: customerId,
      paymentMethod: paymentMethod,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Create from Entity
  factory TransactionDTO.fromEntity(TransactionEntity entity) {
    return TransactionDTO(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      amount: entity.amount,
      type: entity.type,
      category: entity.category,
      status: entity.status,
      referenceNumber: entity.referenceNumber,
      notes: entity.notes,
      date: entity.date,
      customerId: entity.customerId,
      paymentMethod: entity.paymentMethod,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  TransactionDTO copyWith({
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
    return TransactionDTO(
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TransactionDTO &&
        other.id == id &&
        other.title == title &&
        other.amount == amount &&
        other.type == type &&
        other.category == category &&
        other.status == status &&
        other.date == date &&
        other.referenceNumber == referenceNumber &&
        other.notes == notes &&
        other.customerId == customerId &&
        other.paymentMethod == paymentMethod &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      title,
      amount,
      type,
      category,
      status,
      date,
      referenceNumber,
      notes,
      customerId,
      paymentMethod,
      createdAt,
      updatedAt,
    );
  }

  factory TransactionDTO.fromJson(Map<String, dynamic> json) {
    return TransactionDTO(
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'amount': amount,
      'date': Timestamp.fromDate(date),
      'description': description,
      'type': type,
      'status': status,
    };
  }
}
