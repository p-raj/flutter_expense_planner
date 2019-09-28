import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTxn;

  NewTransaction(this._addNewTxn);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;

    if (enteredTitle.isEmpty ||
        enteredAmount.isEmpty ||
        double.tryParse(enteredAmount) < 0.0) {
      return;
    }

    this.widget._addNewTxn(enteredTitle, enteredAmount);
    // access the properties of the widget clss
    // inside the state class
    // pretty cool

    Navigator.of(context).pop();
    // context available in all the classes
    // state is connected to the class
    // flutter automatically connects it
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((DateTime pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        this._selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: titleController,
                onSubmitted: (_) => this._submitData(),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                controller: amountController,
                onSubmitted: (_) => this._submitData(),
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.all(0.0),
                    child: Text(
                        this._selectedDate == null
                            ? 'Choose a Date'
                            : DateFormat.yMd().format(this._selectedDate),
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                        )),
                    onPressed: () => _showDatePicker(),
                  )
                ],
              ),
              Material(
                  child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 2.0),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  //This keeps the splash effect within the circle
                  borderRadius: BorderRadius.circular(
                      100.0), //Something large to ensure a circle
                  onTap: () => this._submitData(),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.add,
                      size: 30.0,
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
