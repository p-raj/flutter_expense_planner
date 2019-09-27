import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';

import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _txn = [];

  void _addNewTxn(String t, String a) {
    final newTxn = Transaction(
        title: t,
        amount: double.parse(a),
        date: DateTime.now(),
        id: DateTime.now().toString()
        );

    setState(() {
      this._txn.add(newTxn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(this._addNewTxn), 
        TransactionList(this._txn)
      ],
    );
  }
}
