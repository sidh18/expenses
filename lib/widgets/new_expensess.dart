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
            TextField(
              controller: _amountcontroller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixText: '\$ ',
                label: Text('amount')),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('cancel'),
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
