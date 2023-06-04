import 'package:flutter/material.dart';

import './user_transaction.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTx;

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }

    addTx(titleController.text, double.parse(amountController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(label: Text('Title')),
              controller: titleController,
                onSubmitted: (_) => submitData()
            ),
            TextField(
              decoration: InputDecoration(label: Text('Amount')),
              controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData()
            ),
            TextButton(
                onPressed: submitData,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.red),
                ))
          ],
        ),
      ),
    );
  }
}
