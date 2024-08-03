import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/pages/add_expense.dart';
import 'package:expense_tracker/widgets/expense_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _addExpense(Expense expense) {
    setState(() {
      Expense.item.add(expense);
    });
  }

  // Remove const here
  @override
  Widget build(BuildContext context) {
    void openOverlay() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 1000, // Set a fixed height for demonstration
            color: Colors.white, // Set a background color to make it visible
            child: Center(
              child: AddExpense(
                addExpense: _addExpense,
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense Tracker", // Corrected typo
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: openOverlay,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ExpenseCard(), // Remove const here
    );
  }
}
