import 'dart:math';

import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactionList = [
    Transaction(id: 1, title: "New shoes", amount: 88.88, date: DateTime.now()),
    Transaction(id: 2, title: "New scarf", amount: 22.22, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        id: Random().nextInt(100),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() => _transactionList.add(newTx));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(_addNewTransaction), TransactionList(_transactionList)],
    );
  }
}
