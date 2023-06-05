import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/main.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColorDark, width: 2)),
                  child: Text(
                    '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMMMEd().format(transactions[index].date),
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
