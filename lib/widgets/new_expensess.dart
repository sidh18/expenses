import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();

  void _presentdatepicker() {
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 1, now.month, now.day);
    showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstdate,
        lastDate: now);
  }

  @override
  void dispose() {
    _titlecontroller.dispose();
    _amountcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titlecontroller,
              maxLength: 50,
              decoration: const InputDecoration(label: Text('Title')),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountcontroller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixText: '\$ ',
                      label: Text('amount'),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Selected date'),
                      IconButton(
                          onPressed: _presentdatepicker,
                          icon: const Icon(Icons.calendar_month))
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print(_titlecontroller.text);
                    print(_amountcontroller.text);
                  },
                  child: const Text("Save Expense"),
                )
              ],
            ),
          ],
        ));
  }
}
