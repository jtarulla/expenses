import 'package:flutter/material.dart';

import './new_transaction.dart';

class UserTransaction extends StatelessWidget {
  final Function addNewTransaction;

  UserTransaction(this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addNewTransaction),
      ],
    );
  }
}
