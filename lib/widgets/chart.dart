import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _txn;

  Chart(this._txn);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;
      for (var i = 0; i < this._txn.length; i++) {
        Transaction t = this._txn[i];
        if ((t.date.day == weekDay.day) &&
            (t.date.month == weekDay.month) &&
            (t.date.year == weekDay.year)) {
          totalSum += t.amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum += item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                      data['day'],
                      data['amount'],
                      this.totalSpending == 0.0
                          ? 0.0
                          : (data['amount'] as double) / this.totalSpending),
              );
            }).toList(),
          ),
        ));
  }
}
