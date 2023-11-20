import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _expenseNameController = TextEditingController();
  var _expensePriceController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.work;

  void _openDatePicker() async {
    DateTime today = DateTime.now();
    DateTime oneYearAgo = DateTime(today.year - 1, today.month, today.day);

    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate == null ? today : _selectedDate!,
      firstDate: oneYearAgo,
      lastDate: today,
    );

    setState(() {
      _selectedDate = selectedDate;
    });
  }

  void _saveExpense() {
    if (_formKey.currentState?.validate() ?? false) {
      Expense newExpense = Expense(
        name: _expenseNameController.text,
        price: double.parse(_expensePriceController.text),
        date: _selectedDate ?? DateTime.now(),
        category: _selectedCategory,
      );

      Navigator.pop(context, newExpense);
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _expenseNameController,
                maxLength: 50,
                decoration: InputDecoration(labelText: "Harcama Adı"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen harcama adını girin';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _expensePriceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Harcama Miktarı",
                        prefixText: "₺",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen harcama miktarını girin';
                        }
                        return null;
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () => _openDatePicker(),
                    icon: const Icon(Icons.calendar_month),
                  ),
                  Text(
                    _selectedDate == null
                        ? "Tarih Seçiniz"
                        : DateFormat.yMd().format(_selectedDate!),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  DropdownButton(
                    value: _selectedCategory,
                    items: Category.values.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) _selectedCategory = value;
                      });
                    },
                  )
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Kapat"),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _saveExpense();
                    },
                    child: Text("Ekle"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
