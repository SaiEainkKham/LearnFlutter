import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this._transactionList, this._deleteTx, {super.key});

  final List<Transaction> _transactionList;
  final Function _deleteTx;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: _transactionList.isEmpty
          ? Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'No Transaction Added yet.',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                              '\$${_transactionList[index].amount.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      _transactionList[index].title,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    subtitle: Text(DateFormat.yMMMEd()
                        .format(_transactionList[index].date)),
                    trailing: IconButton(
                      onPressed: () => _deleteTx(_transactionList[index].id),
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       margin: EdgeInsets.all(12),
                  //       padding: EdgeInsets.all(6),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.all(
                  //           Radius.circular(12),
                  //         ),
                  //         border: Border.all(
                  //           color: Theme.of(context).primaryColor,
                  //           width: 3,
                  //         ),
                  //       ),
                  //       child: Text(
                  //         '\$${_transactionList[index].amount.toStringAsFixed(2)}',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 20,
                  //           color: Theme.of(context).primaryColor,
                  //         ),
                  //       ),
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           _transactionList[index].title,
                  //           style: TextStyle(
                  //             fontSize: 16,
                  //           ),
                  //         ),
                  //         SizedBox(height: 5),
                  //         Text(DateFormat.yMMMEd()
                  //             .format(_transactionList[index].date))
                  //       ],
                  //     )
                  //   ],
                  // ),
                );
              },
              itemCount: _transactionList.length,
            ),
    );
  }
}
