import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction(this._addNewTransaction, {super.key});

  final Function _addNewTransaction;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submitData() {
    final entertitle = titleController.text;
    final enterAmount = double.parse(amountController.text);

    if (entertitle.isEmpty || enterAmount <= 0) {
      return;
    }

    widget._addNewTransaction(
      titleController.text,
      double.parse(amountController.text),
    );

    Navigator.of(context).pop();
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
            TextButton(
              onPressed: _submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(fontSize: 15, color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
