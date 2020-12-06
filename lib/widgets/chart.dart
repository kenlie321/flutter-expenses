import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class Chart extends StatelessWidget {
final List<Transaction> recentTransactions;

Chart(this.recentTransactions);

  List<Map<String,Object>> get groupedTransactionValues{
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index),);
      double totalSum = 0.0;
      
      for(var i = 0; i < recentTransactions.length; i++){
        if(recentTransactions[i].trxDate.day == weekDay.day && 
        recentTransactions[i].trxDate.month == weekDay.month && 
        recentTransactions[i].trxDate.year == weekDay.year){
            totalSum += recentTransactions[i].amount;
        }
      }

      return {'day':DateFormat.E(weekDay), 
      'amount':totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(children: 
        groupedTransactionValues.map((e) {
          return Text("${e['day']} : ${e['amount']}");
        }).toList()
      ,
    ),
    );
  }
}