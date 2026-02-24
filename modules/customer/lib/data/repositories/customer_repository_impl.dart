import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/customer_dto.dart';
import '../../domain/repositories/customer_repository.dart';

/// Implementation of CustomerRepository using Firebase
class CustomerRepositoryImpl implements CustomerRepository {
  /// Firestore instance
  final FirebaseFirestore _firestore;

  /// Collection reference
  late final CollectionReference<Map<String, dynamic>> _collection;

  /// Constructor
  CustomerRepositoryImpl(this._firestore) {
    _collection = _firestore.collection('customers');
  }

  @override
  Future<List<CustomerDTO>> getCustomers() async {
    try {
      final snapshot = await _collection.get();
      return snapshot.docs
          .map((doc) => CustomerDTO.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get customers: $e');
    }
  }

  @override
  Future<CustomerDTO> getCustomerById(String id) async {
    try {
      final doc = await _collection.doc(id).get();
      if (!doc.exists) {
        throw Exception('Customer not found');
      }
      return CustomerDTO.fromJson(doc.data()!);
    } catch (e) {
      throw Exception('Failed to get customer: $e');
    }
  }

  @override
  Future<CustomerDTO> createCustomer(CustomerDTO customer) async {
    try {
      final docRef = _collection.doc();
      final newCustomer = CustomerDTO(
        id: docRef.id,
        name: customer.name,
        email: customer.email,
        phone: customer.phone,
        address: customer.address,
        type: customer.type,
        status: customer.status,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        notes: customer.notes,
      );
      await docRef.set(newCustomer.toJson());
      return newCustomer;
    } catch (e) {
      throw Exception('Failed to create customer: $e');
    }
  }

  @override
  Future<CustomerDTO> updateCustomer(CustomerDTO customer) async {
    try {
      final docRef = _collection.doc(customer.id);
      final updatedCustomer = CustomerDTO(
        id: customer.id,
        name: customer.name,
        email: customer.email,
        phone: customer.phone,
        address: customer.address,
        type: customer.type,
        status: customer.status,
        createdAt: customer.createdAt,
        updatedAt: DateTime.now(),
        notes: customer.notes,
      );
      await docRef.update(updatedCustomer.toJson());
      return updatedCustomer;
    } catch (e) {
      throw Exception('Failed to update customer: $e');
    }
  }

  @override
  Future<void> deleteCustomer(String id) async {
    try {
      await _collection.doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete customer: $e');
    }
  }

  @override
  Future<List<CustomerDTO>> searchCustomers(String query) async {
    try {
      final snapshot = await _collection
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: '$query\uf8ff')
          .get();
      return snapshot.docs
          .map((doc) => CustomerDTO.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to search customers: $e');
    }
  }

  @override
  Future<List<CustomerDTO>> getCustomersByStatus(String status) async {
    try {
      final snapshot =
          await _collection.where('status', isEqualTo: status).get();
      return snapshot.docs
          .map((doc) => CustomerDTO.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get customers by status: $e');
    }
  }

  @override
  Future<List<CustomerDTO>> getCustomersByType(String type) async {
    try {
      final snapshot = await _collection.where('type', isEqualTo: type).get();
      return snapshot.docs
          .map((doc) => CustomerDTO.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get customers by type: $e');
    }
  }
}
