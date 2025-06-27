import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../blocs/transaction/transaction_bloc.dart';
import '../blocs/transaction/transaction_event.dart';
import '../../domain/entities/transaction_entity.dart';

/// Dialog for adding or editing transaction
class TransactionFormDialog extends StatefulWidget {
  /// Transaction to edit (null for new transaction)
  final TransactionEntity? transaction;

  /// Constructor
  const TransactionFormDialog({
    super.key,
    this.transaction,
  });

  @override
  State<TransactionFormDialog> createState() => _TransactionFormDialogState();
}

class _TransactionFormDialogState extends State<TransactionFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  final _referenceNumberController = TextEditingController();
  final _notesController = TextEditingController();
  String _selectedType = 'expense';
  String _selectedCategory = 'general';
  String _selectedStatus = 'pending';
  String _selectedPaymentMethod = 'cash';
  DateTime _selectedDate = DateTime.now();
  String? _selectedCustomerId;

  @override
  void initState() {
    super.initState();
    if (widget.transaction != null) {
      _titleController.text = widget.transaction!.title;
      _descriptionController.text = widget.transaction!.description;
      _amountController.text = widget.transaction!.amount.toString();
      _referenceNumberController.text =
          widget.transaction!.referenceNumber ?? '';
      _notesController.text = widget.transaction!.notes ?? '';
      _selectedType = widget.transaction!.type;
      _selectedCategory = widget.transaction!.category;
      _selectedStatus = widget.transaction!.status;
      _selectedPaymentMethod = widget.transaction!.paymentMethod;
      _selectedDate = widget.transaction!.date;
      _selectedCustomerId = widget.transaction!.customerId;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    _referenceNumberController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final transaction = TransactionEntity(
        id: widget.transaction?.id ?? const Uuid().v4(),
        title: _titleController.text,
        description: _descriptionController.text,
        amount: double.parse(_amountController.text),
        type: _selectedType,
        category: _selectedCategory,
        status: _selectedStatus,
        referenceNumber: _referenceNumberController.text.isEmpty
            ? null
            : _referenceNumberController.text,
        notes: _notesController.text.isEmpty ? null : _notesController.text,
        date: _selectedDate,
        customerId: _selectedCustomerId ?? '',
        paymentMethod: _selectedPaymentMethod,
        createdAt: widget.transaction?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

      if (widget.transaction == null) {
        context.read<TransactionBloc>().add(CreateTransaction(transaction));
      } else {
        context.read<TransactionBloc>().add(UpdateTransaction(transaction));
      }

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
          widget.transaction == null ? 'Add Transaction' : 'Edit Transaction'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedType,
                decoration: const InputDecoration(labelText: 'Type'),
                items: const [
                  DropdownMenuItem(value: 'income', child: Text('Income')),
                  DropdownMenuItem(value: 'expense', child: Text('Expense')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedType = value;
                    });
                  }
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(labelText: 'Category'),
                items: const [
                  DropdownMenuItem(value: 'general', child: Text('General')),
                  DropdownMenuItem(value: 'salary', child: Text('Salary')),
                  DropdownMenuItem(
                      value: 'investment', child: Text('Investment')),
                  DropdownMenuItem(value: 'rent', child: Text('Rent')),
                  DropdownMenuItem(
                      value: 'utilities', child: Text('Utilities')),
                  DropdownMenuItem(value: 'food', child: Text('Food')),
                  DropdownMenuItem(
                      value: 'transport', child: Text('Transport')),
                  DropdownMenuItem(
                      value: 'entertainment', child: Text('Entertainment')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  }
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedStatus,
                decoration: const InputDecoration(labelText: 'Status'),
                items: const [
                  DropdownMenuItem(value: 'pending', child: Text('Pending')),
                  DropdownMenuItem(
                      value: 'completed', child: Text('Completed')),
                  DropdownMenuItem(
                      value: 'cancelled', child: Text('Cancelled')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedStatus = value;
                    });
                  }
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedPaymentMethod,
                decoration: const InputDecoration(labelText: 'Payment Method'),
                items: const [
                  DropdownMenuItem(value: 'cash', child: Text('Cash')),
                  DropdownMenuItem(value: 'card', child: Text('Card')),
                  DropdownMenuItem(
                      value: 'bank_transfer', child: Text('Bank Transfer')),
                  DropdownMenuItem(value: 'other', child: Text('Other')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedPaymentMethod = value;
                    });
                  }
                },
              ),
              TextFormField(
                controller: _referenceNumberController,
                decoration: const InputDecoration(
                    labelText: 'Reference Number (Optional)'),
              ),
              TextFormField(
                controller: _notesController,
                decoration:
                    const InputDecoration(labelText: 'Notes (Optional)'),
                maxLines: 3,
              ),
              ListTile(
                title: const Text('Date'),
                subtitle: Text(_selectedDate.toString().split(' ')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) {
                    setState(() {
                      _selectedDate = date;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submitForm,
          child: Text(widget.transaction == null ? 'Add' : 'Update'),
        ),
      ],
    );
  }
}
