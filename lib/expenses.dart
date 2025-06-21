// import 'package:expense_tracker/models/expense.dart';
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
    Expense(
      title: 'Pizza Hut',
      amount: 08.00,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'new monitor',
      amount: 50.00,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('chart'),
        Text('Expenses list'),
      ],
    ));
  }
}
