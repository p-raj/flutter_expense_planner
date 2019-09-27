import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/widgets/transaction_list.dart';

// import 'package:flutter_expense_planner/widgets/user_transactions.dart';
//# widgets
import './widgets/new_transaction.dart';
//# models
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Personal Expanses',
        home: MyHomePage(),
        theme: ThemeData(
            fontFamily: 'Avenir',
            primarySwatch: Colors.green,
            accentColor: Colors.black87,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0,
              textTheme: TextTheme(
                  title: TextStyle(
                    color: Colors.black87, 
                    fontSize: 26
                    )
                  ),
            )));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _addNewTxn(String t, String a) {
    final newTxn = Transaction(
        title: t,
        amount: double.parse(a),
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      this._txn.add(newTxn);
    });
  }

  final List<Transaction> _txn = [
    Transaction(id: '1', title: 'Paytm', amount: 400.0, date: DateTime.now()),
    Transaction(id: '2', title: 'Uber', amount: 100.0, date: DateTime.now()),
  ];

  void _startAddNewTxn(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(this._addNewTxn),
            behavior: HitTestBehavior.opaque,
            onTap: () {},
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTxn(context),
      ),
      appBar: AppBar(
        title: Text('Personal Expanses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.black,
            onPressed: () => _startAddNewTxn(context),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
              child: Card(
            color: Colors.black,
            child: Text('List of Tx'),
          )),
          TransactionList(this._txn),
        ],
      ),
    );
  }
}
