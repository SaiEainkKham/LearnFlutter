import 'package:expense_tracker/widgets/chart.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.indigo,
          onPrimary: Colors.grey,
          secondary: Colors.purple,
          onSecondary: Colors.brown,
          error: Colors.red,
          onError: Colors.yellow,
          background: Colors.green,
          onBackground: Colors.orange,
          surface: Colors.blue,
          onSurface: Colors.cyan,
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: TextTheme(
          displayMedium: TextStyle(fontSize: 14),
          displayLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactionList = [];

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime choosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: choosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _transactionList.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  void _deleteTx(String id) {
    setState(() {
      _transactionList.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
              onPressed: () {
                _startAddNewTransaction(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Chart(_transactionList),
            ),
            TransactionList(_transactionList, _deleteTx),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewTransaction(context);
        },
      ),
    );
  }
}
