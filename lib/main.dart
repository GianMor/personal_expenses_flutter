import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_expenses_flutter/widgets/new_transaction.dart';
import 'package:personal_expenses_flutter/widgets/transaction_list.dart';
import 'models/transaction.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) => GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => startAddNewTransaction(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[TransactionList(_transactionList)],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => startAddNewTransaction(context)),
    );
  }
}
