import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'New shows', amount: 60, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Groceries', amount: 54.43, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses App'),
      ),
      body: Column(children: <Widget>[
        Container(
          width: double.infinity,
          child: Card(
            child: Text('CHART!'),
            elevation: 5,
          ),
        ),
        Column(
          children: transactions
              .map((transaction) => Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Text(
                            '€ ${transaction.amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple),
                          ),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.purple, width: 2),
                              borderRadius: BorderRadius.circular(7)),
                          padding: EdgeInsets.all(10),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                transaction.title,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(DateFormat.yMMMd().format(transaction.date),
                                style: TextStyle(color: Colors.grey)),
                          ],
                        )
                      ],
                    ),
                  ))
              .toList(),
        )
      ]),
    );
  }
}
