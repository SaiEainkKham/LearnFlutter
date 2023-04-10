import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this._transactionList, {super.key});

  final List<Transaction> _transactionList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _transactionList.map((tx) {
        return Card(
          elevation: 5,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: Colors.amber, width: 3),
                ),
                child: Text(
                  '\$${tx.amount}',
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.title,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(DateFormat.yMMMEd().format(tx.date))
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
