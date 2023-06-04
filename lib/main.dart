import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './widgets/user_transaction.dart';


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

  // String? titleInput;
  // String? amountInput;
  // final titleController = TextEditingController();
  // final amountController = TextEditingController();
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
            UserTransaction()
          ],
        ));
  }
}
