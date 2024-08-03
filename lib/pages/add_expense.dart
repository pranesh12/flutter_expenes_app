import 'package:expense_tracker/model/expense_model.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _formKey = GlobalKey<FormState>();
  final _expenseNameController = TextEditingController();
  final _priceController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  void _addExpense(Expense expense) {
    Expense.item.add(expense);
  }

  void _presentDatePicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final datePicker =
        showDatePicker(context: context, firstDate: now, lastDate: now);
  }

  void _timePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  void _submitExpense() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }

    final expense = _expenseNameController.text;
    final price = double.parse(_priceController.text);
    final newExpense = Expense(name: expense, price: price);
    _addExpense(newExpense);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Expense Name"),
            controller: _expenseNameController,
            onFieldSubmitted: (value) {},
            validator: (value) {
              if ((value == null || value.isEmpty) && value!.length < 6) {
                return "Please Enter the expense name";
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration:
                const InputDecoration(labelText: "Price", prefix: Text("\$")),
            controller: _priceController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter the price";
              }
              return null;
            },
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          Row(children: [
            IconButton(
                onPressed: _presentDatePicker,
                icon: const Icon(Icons.calendar_today)),
            const Spacer(),
            IconButton(
                onPressed: _timePicker, icon: const Icon(Icons.timelapse))
          ]),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _submitExpense,
            child: const Text("Add Expense"),
          )
        ]),
      ),
    );
  }
}
