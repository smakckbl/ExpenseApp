import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:expenseapp/widgets/new_expense.dart'; // Yeni ekledik

import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  List<Expense> expenses = [
    Expense(
        name: "Yiyecek ve İçecek",
        price: 500.529,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        name: "Eğitim",
        price: 200,
        date: DateTime.now(),
        category: Category.work),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
            child: Text("Grafik Bölümü"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                return ExpenseItem(expenses[index]);
              },
            ),
          ),
          const SizedBox(
            height: 150,
            child: Text("Burası bottom bar."),
          ),
          FloatingActionButton(
            onPressed: () {
              // YeniExpense ekranını göster
              showDialog(
                context: context,
                builder: (context) => NewExpense(),
              ).then((result) {
                // Eğer NewExpense ekranından bir sonuç dönerse (mesela ekleme yapıldıysa),
                // expenses listesini güncelle
                if (result != null && result is Expense) {
                  setState(() {
                    expenses.add(result);
                  });
                }
              });
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
