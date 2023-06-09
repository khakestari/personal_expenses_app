import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/main.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.6,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (context, Constraints) {
              return Column(children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: Constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                //SvgPicture.asset('assets/image/minus-database-svgrepo-com.svg'),
              ]);
            })
          : ListView.builder(
        itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      //style: TextStyle(color: Colors.grey),
                    ),
                    trailing: MediaQuery.of(context).size.width > 500
                        ? TextButton.icon(
                            onPressed: () => deleteTx(transactions[index].id),
                            label: Text('Delete'),
                            icon: Icon(
                              Icons.delete,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : IconButton(
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).primaryColor,
                      onPressed: () => deleteTx(transactions[index].id),
                    ),
                  ),
                );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
