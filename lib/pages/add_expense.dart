import 'package:expense_tracker/model/expense_model.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key, required this.addExpense});
  final void Function(Expense expense) addExpense;

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _formKey = GlobalKey<FormState>();

  final _expenseNameController = TextEditingController();
  final _priceController = TextEditingController();
  DateTime? _selectDate;
  TimeOfDay? _selectTime;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectDate = pickedDate;
      print("Date  is $_selectDate");
    });
  }

  void _timePicker() async {
    final now = TimeOfDay.now();

    setState(() {
      _selectTime = now;
      print("Time is $_selectTime");
    });
  }

  void _submitExpense() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }

    final expense = _expenseNameController.text;
    final price = double.parse(_priceController.text);
    final newExpense = Expense(name: expense, price: price);
    widget.addExpense(newExpense);

    _expenseNameController.clear();
    _priceController.clear();

    Navigator.pop(context);
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
