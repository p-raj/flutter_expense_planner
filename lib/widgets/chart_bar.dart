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
          fit: BoxFit.fill,
          child: Text('\$${spendingAmount}'),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            // height: 100,
            width: 30,
            child: Stack(
              children: <Widget>[
                FractionallySizedBox(
                  alignment: Alignment.bottomCenter,
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    // child: Text(label),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColorLight),
                      // color: Color.fromRGBO(220, 220, 220, 0.51),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 1,
        ),
        FittedBox(
          child: Text('${label}'),
        ),
      ],
    );
  }
}
