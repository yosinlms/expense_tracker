// import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/expense_list.dart';
import 'package:expense_tracker/models/expense.dart';
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
      amount: 15.92,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text('chart'),
        Expanded(child: ExpenseList(expenses: _pengeluaranBaru))
      ],
    ));
  }
}
