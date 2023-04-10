import 'package:expense_tracker/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/transaction_list.dart';
import 'widgets/new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart'),
              color: Colors.amber,
              elevation: 5,
            ),
          ),
          UserTransaction(),
        ],
      ),
    );
  }
}
