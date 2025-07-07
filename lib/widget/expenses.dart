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
      title: 'trip to japan',
      amount: 200,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  void openOverlayExpense() {
    showModalBottomSheet(
      context: context,
      //4
      builder: (ctx) => NewExpense(onAddExpense: addExpense),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      _pengeluaranBaru.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Expense Tracker'),
          actions: [
            IconButton(onPressed: openOverlayExpense, icon: Icon(Icons.add)),
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
