import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid = Uuid();

enum Category { food, travel, leisure, work }

final formatter = DateFormat.yMd();

const categoryIcons = {
  Category.food: Icons.launch,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight,
  Category.work: Icons.work
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  String get formatedDate {
    return formatter.format(date);
  }
}
