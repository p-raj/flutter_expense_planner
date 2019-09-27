import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          child: Text('\$${spendingAmount}'),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 40,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration:
                    BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Color.fromRGBO(220, 220, 220, 0.51),
                      borderRadius: BorderRadius.circular(10)
                      ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  // child: Text(label),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        FittedBox(
          child: Text('${label}'),
        ),
      ],
    );
  }
}
