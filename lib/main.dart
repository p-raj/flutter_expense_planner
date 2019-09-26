import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/widgets/new_transaction.dart';
import 'package:flutter_expense_planner/widgets/user_transactions.dart';

import './models/transaction.dart';
import './widgets/user_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> txn = [
    Transaction(id: '1', title: 'Paytm', amount: 400.0, date: DateTime.now()),
    Transaction(id: '2', title: 'Uber', amount: 100.0, date: DateTime.now()),
  ];

  // String titleInput;
  // String amountImput;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    child: Card(
                  color: Colors.black,
                  child: Text('List of Tx'),
                )),
                UserTransactions()
              ],
            ),
          ),
        );
  }
}
