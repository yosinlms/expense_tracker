import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final ammountControler = TextEditingController();
  DateTime? selectedDate;
  // Category selectedCategory = Category.work;

  Category selectedCategory = Category.leisure;

  @override
  void dispose() {
    titleController.dispose;
    ammountControler.dispose;
    super.dispose();
  }

  // void presentDatePicker() async {
  //   final now = DateTime.now();
  //   final firstDate = DateTime(now.year - 1, now.month, now.day);
  //   final pickedDate = await showDatePicker(
  //     context: context,
  //     firstDate: firstDate,
  //     lastDate: now,
  //   );
  //   setState(() {
  //     selectedDate = pickedDate;
  //   });
  // }

  void presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              maxLength: 50,
              decoration: InputDecoration(label: Text('input')),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: ammountControler,
                    decoration:
                        InputDecoration(labelText: 'ammount', prefixText: '\$'),
                  ),
                ),
                Row(
                  children: [
                    Text(selectedDate == null
                        ? 'no selected date'
                        : formatter.format(selectedDate!)),
                    IconButton(
                      onPressed: presentDatePicker,
                      icon: Icon(Icons.calendar_month_outlined),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                // DropdownButton(
                //   value: selectedCategory,
                //   items: Category.values
                //       .map((category) => DropdownMenuItem(
                //             value: category,
                //             child: Text(category.name.toUpperCase()),
                //           ))
                //       .toList(),
                //   onChanged: (value) {
                //     if (value == null) {
                //       return;
                //     }
                //     setState(() {
                //       selectedCategory = value;
                //     });
                //   },
                // ),
                DropdownButton(
                    value: selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name),
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
                  child: Text('cancle'),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    print(titleController.text);
                    print(ammountControler.text);
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ));
  }
}
