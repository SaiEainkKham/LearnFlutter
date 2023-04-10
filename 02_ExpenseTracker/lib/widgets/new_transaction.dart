import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction(this._addNewTransaction, {super.key});

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function _addNewTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            SizedBox(
              height: 4,
            ),
            TextButton(
              onPressed: () {
                _addNewTransaction(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
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
