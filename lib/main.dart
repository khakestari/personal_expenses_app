import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final List<Transaction> transactions = [
    Transaction(
        id: 't0', title: 'Cow\'s pussy', amount: 100, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'Dog\'s dick', amount: 223.5, date: DateTime.now())
  ];

  String? titleInput;
  String? amountInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 70,
              child: Card(
                child: Text('Place holder for chart'),
                elevation: 5,
                color: Colors.blue,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(label: Text('Title')),
                      onChanged: ((value) {
                        titleInput = value;
                      }),
                    ),
                    TextField(
                      decoration: InputDecoration(label: Text('Amount')),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Add Transaction',
                          style: TextStyle(color: Colors.red),
                        ))
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 2)),
                        child: Text(
                          '\$ ${tx.amount}',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMMMEd().format(tx.date),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        )
    );
  }
}
