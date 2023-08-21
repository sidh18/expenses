import 'package:flutter/material.dart';
import 'package:expenses/models/expense.dart';

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
  DateTime? _selecteddate;
  Category _selectedcategory =Category.leisure;

  void _presentdatepicker() async {
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 1, now.month, now.day);
    final pickeddate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstdate,
      lastDate: now,
    );
    setState(() {
      _selecteddate = pickeddate;
    });
  }

  void _submitdata(){
    final enteredamount=double.tryParse(_amountcontroller.text);
    final amountisinvalid = enteredamount == null || enteredamount <=0;;
    if(_titlecontroller.text.trim().isEmpty || amountisinvalid || _selecteddate==null ){
      showDialog(
        context: context, builder: (ctx)=> AlertDialog(
        title: const Text('Invalid Input'),
        content: const Text('Please enter valid title,amount,date and categoty'),
        actions: [
          TextButton(onPressed:(){
            Navigator.pop(ctx);
          }, child: const Text('Okay'))
        ],
      ),
      );
      }
      return;

    
    
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
                      Text(_selecteddate == null
                          ? 'No date selected'
                          : formatter.format(_selecteddate!)),
                      IconButton(
                          onPressed: _presentdatepicker,
                          icon: const Icon(Icons.calendar_month))
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16,),
            Row(
              children: [
                DropdownButton(
                  value:_selectedcategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category ,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if(value==null){
                      return;
                    }
                    setState(() {
                      _selectedcategory = value;
                    });
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: _submitdata,
                  child: const Text("Save Expense"),
                )
              ],
            ),
          ],
        ));
  }
}
