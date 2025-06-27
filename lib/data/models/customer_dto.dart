/// Data Transfer Object for Customer
class CustomerDTO {
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

  /// Constructor
  const CustomerDTO({
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

  /// Create from JSON
  factory CustomerDTO.fromJson(Map<String, dynamic> json) {
    return CustomerDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String?,
      type: json['type'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      notes: json['notes'] as String?,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'type': type,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'notes': notes,
    };
  }

  /// Create a copy with new values
  CustomerDTO copyWith({
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
    return CustomerDTO(
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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomerDTO &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.address == address &&
        other.type == type &&
        other.status == status &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.notes == notes;
  }

  @override
  int get hashCode {
    return Object.hash(
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
    );
  }
}
