import 'package:expense_tracker/model/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({required this.expense, super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            Text(expense.name),
            const Spacer(),
            Text(expense.price.toString())
          ],
        ),
      )),
    );
  }
}
