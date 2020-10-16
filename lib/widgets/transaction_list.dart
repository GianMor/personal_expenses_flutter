import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: transaction
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
