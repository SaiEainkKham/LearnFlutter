import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction(this._addNewTransaction, {super.key});

  final Function _addNewTransaction;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  //
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime? _selectedDate;

  void _submitData() {
    if (amountController.text.isEmpty) return;

    final entertitle = titleController.text;
    final enterAmount = double.parse(amountController.text);

    if (entertitle.isEmpty || enterAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget._addNewTransaction(
      entertitle,
      enterAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then(
      (_pickDate) {
        if (_pickDate == null) return;
        setState(() {
          _selectedDate = _pickDate;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen!'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate as DateTime)}'),
                  ),
                  TextButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Select Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            TextButton(
              onPressed: _submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(fontSize: 15, color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
