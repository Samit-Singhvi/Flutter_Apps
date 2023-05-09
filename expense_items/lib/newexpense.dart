import 'package:expense_items/expenses.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './models/expense.dart' as model;
import './models/expense.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  final void Function(model.Expense expense) onAddExpense;
  const NewExpense({super.key, required this.onAddExpense});

  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // String titleInput = '';

  // void addExpense(String title) {
  //   titleInput = title;
  // }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  var _selectedCategory = model.Category.leisure;

  void validateEntry() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: ((ctx) => AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: Text(' y'))
                ],
                title: Text('Invalid Input'),
                content: Text(
                    'Please make sure you enter the valid name, amount and category'),
              )));
      return;
    }
    widget.onAddExpense(Expense(
        amount: enteredAmount,
        date: _selectedDate!,
        name: _titleController.text.trim(),
        category: _selectedCategory));
    Navigator.pop(context);
  }

  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1 - now.month - now.day);
    final lastDate = now;
    final _pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);

    setState(() {
      _selectedDate = _pickedDate;
    });
  }

  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(12, 48, 16, 16),
          child: TextField(
            decoration: InputDecoration(label: Text('Title')),
            controller: _titleController,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 16, 12),
                child: TextField(
                  decoration:
                      InputDecoration(label: Text('Amount'), prefixText: "\$"),
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  _selectedDate == null
                      ? Text('No Date Selected')
                      : Text(formatter.format(_selectedDate!)),
                  IconButton(
                      onPressed: _showDatePicker,
                      icon: Icon(Icons.calendar_month))
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            DropdownButton(
                value: _selectedCategory,
                items: model.Category.values
                    .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase())))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                }),
            ElevatedButton(onPressed: validateEntry, child: Text('Submit')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel')),
          ],
        )
      ],
    );
  }
}
