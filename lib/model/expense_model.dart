import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Expense {
  String id;
  String name;
  double price;

  Expense({required this.name, required this.price}) : id = uuid.v4();
  static final List<Expense> item = [
    Expense(name: "Buying Stock", price: 34),
    Expense(name: "Bus Ticket", price: 5),
    Expense(name: "Movie", price: 15),
    Expense(name: "Gas", price: 100),
  ];
}
