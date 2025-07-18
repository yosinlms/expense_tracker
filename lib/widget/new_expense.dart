import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  // //menambahkan expense (part 2)
  final void Function(Expense expense) onAddExpense;

  //2
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

@override
class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectDate;
  Category selectedCategory = Category.food;

  @override
  void dispose() {
    titleController.dispose;
    amountController.dispose;
    super.dispose();
  }

  void presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      selectDate = pickedDate;
    });
  }

  void submitExpenseData() {
    final enteredAmount = double.tryParse(amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (titleController.text.trim().isEmpty ||
        selectDate == null ||
        amountIsInvalid) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('invalid data'),
          content: Text('pastikan anda sudah mengisi form'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Mengerti'))
          ],
        ),
      );
      return;
    }

    //menambahkan expense (part 3)
    widget.onAddExpense(Expense(
        title: titleController.text,
        amount: enteredAmount,
        date: selectDate!,
        category: selectedCategory));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 48, 16, 48),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Title'),
            maxLength: 50,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                    controller: amountController,
                    decoration:
                        InputDecoration(labelText: 'amount', prefixText: '\$'),
                    keyboardType: TextInputType.number),
              ),
              Row(
                children: [
                  Text(selectDate == null
                      ? 'no selected date '
                      : formatter.format(selectDate!)),
                  IconButton(
                      onPressed: presentDatePicker,
                      icon: Icon(Icons.calendar_month))
                ],
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                  value: selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      selectedCategory = value;
                    });
                  }),
              Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancle')),
              SizedBox(width: 8),
              ElevatedButton(
                  onPressed: () {
                    submitExpenseData();
                    // print(amountControler.text);
                    // print(titleController.text);
                  },
                  child: Text('Save'))
            ],
          )
        ],
      ),
    );
  }
}
