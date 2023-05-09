import 'package:expense_items/expense_item.dart';
import 'package:expense_items/models/expense.dart';
import 'package:flutter/material.dart';
// import '../models/expense.dart';

class Expense_List extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) removeExpenseItem;
  const Expense_List(
      {super.key, required this.expenses, required this.removeExpenseItem});

  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, idx) => Dismissible(
              key: ValueKey(expenses[idx]),
              child: ExpenseItem(expenses[idx]),
              onDismissed: (direction) => removeExpenseItem(expenses[idx]),
            ));
  }
}
