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
      // height: 500,
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
              // shrinkWrap: true,
              itemBuilder: (ctx, idx) {
                final t = _userTXN[idx];
                return ListTile(
                  leading: CircleAvatar(
                    // backgroundColor: Colors.transparent,
                    radius: 30,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: FittedBox(
                          child: Text(
                              '\$${t.amount.toStringAsFixed(1)}' // string interpolation
                              ),
                        ),
                      ),
                    ),
                  ),
                  title:
                      Text(t.title, style: Theme.of(context).textTheme.title),
                  subtitle: Text(DateFormat.yMMMEd().format(t.date),
                      style: Theme.of(context).textTheme.subtitle),
                );
              },
              itemCount: _userTXN.length,
            ),
    );
  }
}
