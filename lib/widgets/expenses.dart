import 'package:expenses/widgets/expenses_list/expesnses_list.dart';
import 'package:expenses/models/expense.dart';
import 'package:expenses/widgets/new_expensess.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({
    super.key,
  });

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
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onaddexpense: _addexpense),
    );
  }

  void _addexpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeexpense(Expense expense) {
    final expenseIndex=_registeredExpenses.indexOf(expense);
    setState(
      () {
        _registeredExpenses.remove(expense);
      },
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration:const Duration(seconds: 3) ,
        content:const Text('Expense Deleted'),
        action: SnackBarAction(label: 'undo', onPressed:(){
          setState(() {
            _registeredExpenses.insert(expenseIndex,expense);
          });
        }),
        )
        );
  }

  @override
  Widget build(BuildContext context) {
    Widget maincontent = const Center(child:Text('No Expenses Found'),
    );

    if(_registeredExpenses.isNotEmpty){
      maincontent = Expenseslist(
          expenses: _registeredExpenses,
          onremoveexpense: _removeexpense,
          );
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openaddexpenseoverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
            child:maincontent,
          ),
        ],
      ),
    );
  }
}
