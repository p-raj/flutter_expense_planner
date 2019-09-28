import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/widgets/transaction_list.dart';

// import 'package:flutter_expense_planner/widgets/user_transactions.dart';
//# widgets
import './widgets/new_transaction.dart';
import './widgets/chart.dart';
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
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  subtitle: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                ),
            appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0,
              textTheme: TextTheme(
                  title: TextStyle(color: Colors.black87, fontSize: 26)),
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
    print(DateTime.now());
  }

  // final List<Transaction> _txn = []
  final List<Transaction> _txn = [
    Transaction(
        id: '1', title: 'Paytm', amount: 400.0, date: DateTime(2019, 09, 23)),
    Transaction(
        id: '2', title: 'Uber', amount: 100.0, date: DateTime(2019, 09, 24)),
    Transaction(
        id: '3', title: 'ICIC', amount: 100.0, date: DateTime(2019, 09, 25)),
    Transaction(
        id: '4', title: 'Zomato', amount: 100.0, date: DateTime(2019, 09, 25)),
    Transaction(
        id: '5', title: 'Amazon', amount: 100.0, date: DateTime(2019, 09, 26)),
    Transaction(
        id: '6', title: 'AWS', amount: 100.0, date: DateTime(2019, 09, 26)),
    Transaction(id: '7', title: 'Azure', amount: 100.0, date: DateTime.now()),
    Transaction(id: '8', title: 'Laptop', amount: 100.0, date: DateTime.now()),
    Transaction(id: '9', title: 'GPU', amount: 100.0, date: DateTime.now()),
    Transaction(id: '9', title: 'Desktop', amount: 100.0, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return this._txn.where((t) {
      return t.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

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
      body: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Chart(this._recentTransactions)
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: TransactionList(this._txn)
            ),
          ],
        ),
    );
  }
}
