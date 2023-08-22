import 'package:expenses/models/expense.dart';
import 'package:expenses/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class Expenseslist extends StatelessWidget {
  const Expenseslist({
    super.key,
    required this.expenses,
    required this.onremoveexpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense)onremoveexpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed:(direction){
            onremoveexpense(expenses[index]);
          }, 
          child:ExpenseItem(expenses[index]),),);
  }
}
