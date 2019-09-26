//# fultter
import 'package:flutter/material.dart';
//# 3p packages
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;

  TransactionList(
      {
        @required this.title, 
        @required this.amount, 
        @required this.date
      }
    );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              '\$ ${this.amount}' // string interpolation
            ),
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(border: Border.all(
              color: Colors.black,
              width: 2.0,
              style: BorderStyle.solid
            )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 16
                ),
              ), 
              Text(
                DateFormat.yMMMEd().format(this.date),
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
  }
}
