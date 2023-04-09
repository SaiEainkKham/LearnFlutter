import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  TransactionList({super.key});

  List<Transaction> transactionList = [
    Transaction(
      id: 't1',
      title: 'Shoe',
      amount: 72,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Card',
      amount: 34,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          (transactionList.map((tx) {
            return Card(
              child: Text(tx.title),
            );
          }) as Widget),
        ],
      ),
    );
  }
}
