import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter=DateFormat.yMd();

const uuid=Uuid();

enum Category{  food ,travel ,leisure ,work }

const categoryicons={
  Category.food:Icons.lunch_dining,
  Category.travel:Icons.flight_takeoff,
  Category.leisure:Icons.movie,
  Category.work:Icons.work,
};

class Expense{
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
   }) :id=uuid.v4() ; 

   String get formatteddate {
    return formatter.format(date);
   }
}

class Expensebucket{
const Expensebucket({
  required this.category,
  required this.expenses,
});

  Expensebucket.forCategory(
    List<Expense>allExpenses,this.category
  ) : expenses=allExpenses
  .where((expense) => expense.category==category).toList();
  
  final Category category;
  final List<Expense>expenses;

  double get totalexpenses{
    double sum=0;

    for(final expense in expenses){
      sum +=expense.amount;
    }
      return sum;
    }
}