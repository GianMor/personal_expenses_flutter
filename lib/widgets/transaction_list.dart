import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTransactionById;

  TransactionList(this.transaction, this.deleteTransactionById);
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.6,//60%
        child: transaction.isEmpty
            ? Column(
                children: <Widget>[
                  Text('No transaction added yet',
                      style: Theme.of(context).textTheme.headline6),
                  Container(
                      height: 200,
                      margin: EdgeInsets.all(15),
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: FittedBox(
                            child: Text(
                                '\$${transaction[index].amount.toStringAsFixed(2)}'),
                          ),
                        ),
                      ),
                      title: Text(
                        transaction[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                          DateFormat.yMMMMd().format(transaction[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteTransactionById(transaction[index].id);
                        },
                      ),
                    ),
                  );
                  // return Card(
                  //     child: Row(children: <Widget>[
                  //   Container(
                  //       margin:
                  //           EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  //       decoration: BoxDecoration(
                  //           border: Border.all(
                  //               color: Theme.of(context).primaryColorLight,
                  //               width: 2)),
                  //       padding: EdgeInsets.all(10),
                  //       child: Text(
                  //         '\$${transaction[index].amount.toStringAsFixed(2)}',
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 20,
                  //             color: Theme.of(context).primaryColorDark),
                  //       )),
                  //   Column(
                  //     children: <Widget>[
                  //       Text(
                  //         transaction[index].title,
                  //         style: Theme.of(context).textTheme.headline6,
                  //       ),
                  //       Text(
                  //         DateFormat()
                  //             .add_yMMMMEEEEd()
                  //             .format(transaction[index].date),
                  //         style: TextStyle(fontSize: 14, color: Colors.grey),
                  //       )
                  //     ],
                  //   )
                  // ]));
                },
                itemCount: transaction.length,
              ));
  }
}
