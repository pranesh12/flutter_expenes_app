import 'package:expense_tracker/pages/add_expense.dart';
import 'package:expense_tracker/widgets/expense_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key}); // Remove const here

  @override
  Widget build(BuildContext context) {
    void openOverlay() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 1000, // Set a fixed height for demonstration
            color: Colors.white, // Set a background color to make it visible
            child: const Center(
              child: AddExpense(),
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
