import 'package:equatable/equatable.dart';

/// Entity class representing a customer
/// This is the core business object used throughout the application
class CustomerEntity extends Equatable {
  /// Customer ID
  final String id;

  /// Customer name
  final String name;

  /// Customer email
  final String email;

  /// Customer phone number
  final String phone;

  /// Customer address
  final String? address;

  /// Customer type (individual/business)
  final String type;

  /// Customer status (active/inactive)
  final String status;

  /// Customer created date
  final DateTime createdAt;

  /// Customer updated date
  final DateTime updatedAt;

  /// Customer notes
  final String? notes;

  /// Default constructor
  const CustomerEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.address,
    required this.type,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.notes,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        address,
        type,
        status,
        createdAt,
        updatedAt,
        notes,
      ];

  /// Create a copy of this CustomerEntity with the given fields replaced with the new values
  CustomerEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? address,
    String? type,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? notes,
  }) {
    return CustomerEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      type: type ?? this.type,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      notes: notes ?? this.notes,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          phone == other.phone &&
          address == other.address &&
          type == other.type &&
          status == other.status &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          notes == other.notes;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      address.hashCode ^
      type.hashCode ^
      status.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      notes.hashCode;
}
