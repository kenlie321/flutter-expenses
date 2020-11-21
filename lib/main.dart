import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_expenses/widgets/new_transaction.dart';
import 'package:flutter_expenses/widgets/transaction_list.dart';
import 'model/transaction.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expenses",
      home: FlutterExpenses(),
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              // ignore: deprecated_member_use
              title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light()
                .textTheme
                // ignore: deprecated_member_use
                .copyWith(title: TextStyle(fontFamily: 'OpenSans')),
          )),
    );
  }
}

class FlutterExpenses extends StatefulWidget {
  @override
  _FlutterExpensesState createState() => _FlutterExpensesState();
}

class _FlutterExpensesState extends State<FlutterExpenses> {
  final List<Transaction> _listTrx = [
    Transaction(
      id: "1",
      title: "Snacks",
      amount: 12,
      trxDate: DateTime.now(),
    ),
    Transaction(
        id: "2",
        title: "Drinks",
        amount: 3,
        trxDate: DateTime.now().add(new Duration(hours: 1)))
  ];
  final random = new Random();

  void _addNewTransaction(String titleParam, double amountParam) {
    final trx = Transaction(
        id: random.nextInt(100).toString(),
        title: titleParam,
        amount: amountParam,
        trxDate: DateTime.now());

    setState(() {
      _listTrx.add(trx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            onTap: () {},
            child: NewTransactions(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personal Expenses",
          // style: TextStyle(
          //   fontFamily: 'OpenSans',
          // ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Container(
                width: double.infinity,
                child: Text("Chart"),
              ),
            ),
            TransactionList(_listTrx)
          ],
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
