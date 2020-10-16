import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionList createState() => _TransactionList();
}

class _TransactionList extends State<TransactionList> {
  final List<Transaction> _transactionList = [
    Transaction(id: 1, title: "New shoes", amount: 88.88, date: DateTime.now()),
    Transaction(id: 2, title: "New scarf", amount: 22.22, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _transactionList
            .map((tx) => Card(
                    child: Row(children: <Widget>[
                  Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.deepOrange, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${tx.amount}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.orange),
                      )),
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tx.title,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat().add_yMMMMEEEEd().format(tx.date),
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      )
                    ],
                  )
                ])))
            .toList());
  }
}
