import 'package:flutter/material.dart';
import 'package:personal_expenses_flutter/transaction.dart';
import 'package:intl/intl.dart';

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
  final List<Transaction> transaction = [
    Transaction(id: 1, title: "New shoes", amount: 88.88, date: DateTime.now()),
    Transaction(id: 2, title: "New scarf", amount: 22.22, date: DateTime.now()),
  ];

  // String titleInput;
  // String amountTitle;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
          children: <Widget>[
            Card(child: Text("CHART")),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleController,
                      // onChanged: (val) => titleInput = val,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,
                      // onChanged: (val) => amountTitle = val,
                    ),
                    FlatButton(
                      onPressed: () => null,
                      child: Text('Add transaction'),
                      textColor: Colors.orange,
                    )
                  ],
                ),
              ),
            ),
            Column(
                children: transaction
                    .map((tx) => Card(
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.deepOrange, width: 2)),
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    DateFormat()
                                        .add_yMMMMEEEEd()
                                        .format(tx.date),
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                        ))
                    .toList())
          ],
        ));
  }
}
