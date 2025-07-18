import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  final List<Expense> expenses;
  //menghapus expense (Part 2)
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) =>
          //menghapus expense (Part 3)
          Dismissible(
        onDismissed: (direction) => onRemoveExpense(expenses[index]),
        key: ValueKey(expenses[index]),
        background: Container(
          // menggunakan theme
          color: Theme.of(context).colorScheme.error.withOpacity(0.50),
          margin: EdgeInsets.symmetric(horizontal: 10),
        ),
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}

//  return ListView.builder(
//       itemCount: expenses.length,
//       itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),
//     );
