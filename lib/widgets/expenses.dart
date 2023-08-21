import 'package:expenses/widgets/expenses_list/expesnses_list.dart';
import 'package:expenses/models/expense.dart';
import 'package:expenses/widgets/new_expensess.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Cricket',
      amount: 50,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Shoes',
      amount: 20.55,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  void _openaddexpenseoverlay() {
    showModalBottomSheet(
      context: context,
      builder:(ctx) =>const NewExpense(),
  );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Expense Tracker'),
        actions: [
        IconButton(
          onPressed:_openaddexpenseoverlay,
          icon: const Icon(Icons.add),
          ),
      ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(child: Expenseslist(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
