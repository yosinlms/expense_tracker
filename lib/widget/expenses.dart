// import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expenses_list/expense_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _pengeluaranBaru = [
    Expense(
      title: 'flutter course',
      amount: 15,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'trip to japan',
      amount: 2000,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  void addExpense() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Expense Tracker'),
          actions: [
            IconButton(onPressed: addExpense, icon: Icon(Icons.add)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ExpenseList(expenses: _pengeluaranBaru),
              )
            ],
          ),
        ));
  }
}
