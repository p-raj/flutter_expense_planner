//# fultter
import 'package:flutter/material.dart';
//# 3p packages
import 'package:intl/intl.dart';

// #app packages
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTXN;

  TransactionList(this._userTXN);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _userTXN.map((t) {
      return Card(
        child: Row(
          children: <Widget>[
            Container(
              child: Text('\$ ${t.amount}' // string interpolation
                  ),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                      style: BorderStyle.solid)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  t.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 16),
                ),
                Text(
                  DateFormat.yMMMEd().format(t.date),
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                )
              ],
            )
          ],
        ),
      );
    }).toList());
  }
}
