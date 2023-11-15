import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _expenseNameController = TextEditingController();
  final _expensePriceController = TextEditingController();
  var _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime.now().subtract(const Duration(days: 365)),
        lastDate: DateTime.now());

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          TextField(
            controller: _expenseNameController,
            maxLength: 50,
            decoration: const InputDecoration(labelText: "Harcama Adı"),
          ),
          TextField(
            controller: _expensePriceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Harcama Miktarı"),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.calendar_month),
                onPressed: () => _selectDate(context),
              ),
            ],
          ),
          Text(DateFormat.yMMMMEEEEd().format(_selectedDate)),
          ElevatedButton(
            onPressed: () {
              print(
                  "Kaydedilen değer: ${_expenseNameController.text} ${_expensePriceController.text}");
            },
            child: const Text("Ekle"),
          ),
        ]),
      ),
    );
  }
}
