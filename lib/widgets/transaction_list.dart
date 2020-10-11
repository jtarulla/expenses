import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 160,
        child: transactions.isEmpty
            ? Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    Text('No Transactions Added Yet...',
                        style: TextStyle(fontSize: 15)),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        height: 200,
                        child: Image.asset('assets/images/waiting.png',
                            fit: BoxFit.cover)),
                  ],
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 9,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                                child: Text('€${transactions[index].amount}')),
                          ),
                        ),
                        title: Text(
                          transactions[index].title,
                          // style: Theme.of(context).textTheme.headline6,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(DateFormat.yMMMd()
                            .format(transactions[index].date)),
                        trailing: IconButton(
                            icon: Icon(Icons.delete_outline),
                            color: Colors.lime,
                            onPressed: () =>
                                deleteTransaction(transactions[index].id)),
                      ));
                },
                itemCount: transactions.length,
              ));
  }
}
