import 'package:flutter/material.dart';

import './transaction.dart';
import './transaction_card.dart';

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

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                child: Card(
              color: Colors.black,
              child: Text('List of Tx'),
            )),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                      controller: titleController,
                      onChanged: (v) {},
                    ), 
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Amount',
                      ),
                      controller: amountController,
                      onChanged: (v) {},
                    ), 
                    FlatButton(
                      child: Text('Add'),
                      textColor: Colors.redAccent.shade400,
                      onPressed: () {
                        
                      },
                    )
                  ],
                ),
              ),
            ),
            Column(
                children: txn.map((tx) {
              return TransactionCard(
                  title: tx.title, amount: tx.amount, date: tx.date);
            }).toList()),
          ],
        ),
      ),
    );
  }
}
