import 'package:flutter/material.dart';

import 'models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Below Your Needs',
      theme: ThemeData(
        accentColor: Colors.limeAccent,
        primarySwatch: Colors.lime,
        fontFamily: 'Quicksand',
        //  To change the style of the TITLE
        // appBarTheme: AppBarTheme(
        //     textTheme: ThemeData.light().textTheme.copyWith(
        //         // ignore: deprecated_member_use
        //         title: TextStyle(fontFamily: 'OpenSans', fontSize: 20)))
      ),
      // darkTheme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where((transaction) => transaction.date
            .isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date != null ? date : DateTime.now());

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Below Your Means'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Chart(_recentTransactions),
          TransactionList(_userTransactions, _deleteTransaction),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewTransaction(context);
        },
      ),
    );
  }
}
