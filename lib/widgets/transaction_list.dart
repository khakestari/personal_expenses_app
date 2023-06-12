import 'package:flutter/material.dart';

import './transaction_item.dart';
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
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
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
          : ListView(
              children: transactions
                  .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTx))
                  .toList()
            
      ),
    );
  }
}

