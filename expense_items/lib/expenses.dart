import 'package:expense_items/charts/chart.dart';
import 'package:expense_items/expense_list.dart';
import 'package:expense_items/newexpense.dart';
import 'package:flutter/material.dart';
import 'models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses();

  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registeredExpenses = [
    Expense(
        amount: 19.99,
        date: DateTime.now(),
        name: "Flutter Course",
        category: Category.work),
    Expense(
        amount: 15.69,
        date: DateTime.now(),
        name: "Cinema",
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(onAddExpense: addNewExpense);
        });
  }

  void addNewExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  void removeNewExpense(Expense expense) {
    final expenseIndex = registeredExpenses.indexOf(expense);
    setState(() {
      registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense Delted'),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () => setState(() {
          registeredExpenses.insert(expenseIndex, expense);
        }),
      ),
    ));
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = Center(
      child: Card(
          child: Text(
        'No Expenses Added ! Start Adding using + Button',
        style: TextStyle(
            fontSize: 16,
            color: Colors.green,
            backgroundColor: Color.fromARGB(255, 254, 242, 132)),
      )),
    );

    if (registeredExpenses.isNotEmpty) {
      mainContent = Expense_List(
        expenses: registeredExpenses,
        removeExpenseItem: removeNewExpense,
      );
    }
    return Scaffold(
        appBar: AppBar(
            title: Text('Flutter ExpenseTracker'),
            leading: IconButton(
                onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add))),
        body: width < 600
            ? Column(
                children: [
                  Chart(expenses: registeredExpenses),
                  Expanded(child: mainContent),
                ],
              )
            : Row(
                children: [
                  Expanded(child: Chart(expenses: registeredExpenses)),
                  mainContent,
                ],
              ));
  }
}
