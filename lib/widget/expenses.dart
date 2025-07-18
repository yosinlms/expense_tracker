// import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/charts/chart.dart';
import 'package:expense_tracker/widget/expenses_list/expense_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({
    super.key,
  });

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _pengeluaranBaru = [
    Expense(
      title: 'Trip to Japan 🇯🇵',
      amount: 200,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  void openOverlayExpense() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      //menambahkan expense (part 4)
      builder: (ctx) => NewExpense(
        onAddExpense: addExpense,
      ),
    );
  }

//menambahkan expense (part 1)
  void addExpense(Expense expense) {
    setState(() {
      _pengeluaranBaru.add(expense);
    });
  }

//menghapus expense (Part 1)
  void removeExpense(Expense expense) {
    final expenseIndex = _pengeluaranBaru.indexOf(expense);
    setState(() {
      _pengeluaranBaru.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data Berhasil Dihapus'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: ('urungkan'),
          onPressed: () {
            setState(() {
              _pengeluaranBaru.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
//membuat state kosong
    Widget mainContent = Center(
      child: Text('Data ksong'),
    );
    if (_pengeluaranBaru.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _pengeluaranBaru,
        onRemoveExpense: removeExpense,
      );
    }

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
              Chart(expenses: _pengeluaranBaru),
              Expanded(child: mainContent),
            ],
          ),
        ));
  }
}
