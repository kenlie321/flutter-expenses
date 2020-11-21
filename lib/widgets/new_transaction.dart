import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  final Function handleOnPressed;

  NewTransactions(this.handleOnPressed);

  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void onBtnPressed() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.handleOnPressed(
        titleController.text, double.parse(amountController.text));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "Title"),
                  controller: titleController,
                  onSubmitted: (_) => onBtnPressed(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Amount"),
                  keyboardType: TextInputType.number,
                  controller: amountController,
                  onSubmitted: (_) => onBtnPressed(),
                ),
                FlatButton(
                  onPressed: onBtnPressed,
                  child: Text("Add Transaction"),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
