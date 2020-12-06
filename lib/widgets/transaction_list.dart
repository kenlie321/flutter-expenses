import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listTrx;

  TransactionList(this.listTrx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: listTrx.isEmpty ? 
      Column(children: [
        // ignore: deprecated_member_use
        Text("No Transactions Yet!", style: Theme.of(context).textTheme.title,
        ),
        SizedBox(
          height: 200,
          child: Image.asset('assets/image/waiting.png', fit:BoxFit.cover,),
        )
        ],
      )
      :
      ListView.builder(
        itemBuilder: (ctx, i) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "\$${listTrx[i].amount.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listTrx[i].title,
                      // ignore: deprecated_member_use
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text(
                      DateFormat("dd-MMM-yyyy").format(listTrx[i].trxDate),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: listTrx.length,
      ),
    );
  }
}
