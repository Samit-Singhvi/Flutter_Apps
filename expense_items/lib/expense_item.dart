import 'package:expense_items/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_items/expenses.dart';
import '../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  ExpenseItem(this.expense);

  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Text(expense.name),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${expense.amount.toString()}'),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Icon(categoryIcons[expense.category]),
                Text('${expense.formattedDate.toString()}'),
              ],
            )
          ],
        )
      ]),
    );
  }
}
