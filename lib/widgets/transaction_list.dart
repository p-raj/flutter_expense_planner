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
        child: _userTXN.isEmpty
            ? Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/nope.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, idx) {
                  final t = _userTXN[idx];
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                              '\$ ${t.amount.toStringAsFixed(2)}' // string interpolation
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
                            Text(t.title,
                                style: Theme.of(context).textTheme.title),
                            Text(DateFormat.yMMMEd().format(t.date),
                                style: Theme.of(context).textTheme.subtitle)
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
