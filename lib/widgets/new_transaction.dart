import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTxn;

  NewTransaction(this._addNewTxn);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;

    if (enteredTitle.isEmpty || enteredAmount.isEmpty || double.tryParse(enteredAmount) < 0.0) {
      return;
    }

    this.widget._addNewTxn(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: titleController,
                onSubmitted: (_) => this.submitData(),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                controller: amountController,
                onSubmitted: (_) => this.submitData(),
              ),
              FlatButton(
                child: Text('Add'),
                textColor: Colors.redAccent.shade400,
                onPressed: () => this.submitData(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
