import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 160,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text('No Transactions Added Yet...'),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 200,
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.cover)),
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Text(
                              '€ ${transactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColorDark),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColorDark,
                                    width: 2),
                                borderRadius: BorderRadius.circular(7)),
                            padding: EdgeInsets.all(10),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  transactions[index].title,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                  DateFormat.yMMMd()
                                      .format(transactions[index].date),
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          )
                        ],
                      ),
                      elevation: 15);
                },
                itemCount: transactions.length,
              ));
  }
}
