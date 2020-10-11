import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // double deviceWidth = MediaQuery.of(context).size.width;
  // double deviceHeight = MediaQuery.of(context).size.height;

  final List<Transaction> _userTransactions = [
    // Transaction(id: 't1', title: 'Shoes', amount: 99.99, date: DateTime.now()),
    // Transaction(id: 't2', title: 'Shirts', amount: 69.99, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context))
        ],
        title: Text('Personal Expenses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              // width: deviceWidth * 0.30,
              // height: deviceHeight * 0.30,
              child: Card(
                elevation: 5,
                child: Text('CHART!'),
                color: Colors.blueAccent,
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNewTransaction(context),
          child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
