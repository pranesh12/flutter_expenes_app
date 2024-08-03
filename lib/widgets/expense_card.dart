import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/widgets/expense_list.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatefulWidget {
  const ExpenseCard({super.key});

  @override
  State<ExpenseCard> createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {
  void _rmoveExpense(Expense expense) {
    setState(() {
      Expense.item.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Expense.item.length,
      itemBuilder: (context, idx) {
        return Dismissible(
            key: ValueKey(Expense.item[idx]),
            onDismissed: (directiron) {
              _rmoveExpense(Expense.item[idx]);
            },
            child: ExpenseList(expense: Expense.item[idx]));
      },
    );
  }
}
