import 'package:expenses/models/expense.dart';
import 'package:expenses/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class Expenseslist extends StatelessWidget {
  const Expenseslist({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => ExpenseItem(expenses[index]));
  }
}
