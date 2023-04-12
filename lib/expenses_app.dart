import 'package:despesas_pessoais/presentation/home_page/home_page.dart';
import 'package:flutter/material.dart';

import 'controller/statistic_controller.dart';
import 'controller/transaction_controller.dart';

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionListController.transactionsListController.getTransactions();
    TransactionListController.transactionsListController
        .getTransactionsOfLastSevenDayslist();
    StatisticController.statisticController.initStatistic();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        highlightColor: const Color(0xff08c4ad),
        primaryColor: const Color(0xff05103a),
        primaryColorLight: const Color(0xff1c1c8d),
        appBarTheme: const AppBarTheme(
          color: Color(0xff05103a),
          elevation: 0,
        ),
      ),
    );
  }
}
