import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, leisure, work, travel }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  Category.travel: Icons.flight
};

class Expense {
  Expense(
      {required this.amount,
      required this.date,
      required this.name,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String name;
  final DateTime date;
  final double amount;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final List<Expense> expenses;
  final Category category;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum = sum + expense.amount;
    }

    return sum;
  }
}
