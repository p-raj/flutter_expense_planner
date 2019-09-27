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
    return Container(
        height: 500,
        child: ListView.builder(
          itemBuilder: (ctx, idx) {
            final t = _userTXN[idx];
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text('\$ ${t.amount.toStringAsFixed(2)}' // string interpolation
                        ),
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor,
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
                            fontSize: 20,
                            color: Theme.of(context).accentColor
                          ),
                      ),
                      Text(
                        DateFormat.yMMMEd().format(t.date),
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).accentColor
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: _userTXN.length,
        ));
  }
}
