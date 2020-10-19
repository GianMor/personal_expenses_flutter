import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
                child: Row(children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColorLight, width: 2)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$${transaction[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColorDark),
                  )),
              Column(
                children: <Widget>[
                  Text(
                    transaction[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    DateFormat()
                        .add_yMMMMEEEEd()
                        .format(transaction[index].date),
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  )
                ],
              )
            ]));
          },
          itemCount: transaction.length,
        ));
  }
}
