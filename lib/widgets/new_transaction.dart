import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function _addNewTxn;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this._addNewTxn);

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
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                controller: amountController,
              ),
              FlatButton(
                child: Text('Add'),
                textColor: Colors.redAccent.shade400,
                onPressed: () => this._addNewTxn(
                    titleController.text, 
                    amountController.text
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
