import 'dart:math';

import 'package:despesas_pessoais/domain/transaction_model.dart';
import 'package:flutter/widgets.dart';

class TransactionListController extends ChangeNotifier {
  static TransactionListController transactionsListController =
      TransactionListController();

  List<Transaction> transactionList = [];

  addTransaction(String name, double value, DateTime datePicked) {
    Transaction newTransaction = Transaction(
        date: datePicked,
        id: Random().nextDouble().toString(),
        name: name,
        value: value);

    transactionList.add(newTransaction);
    notifyListeners();
  }
}

List<Transaction> get recentTransactions {
  return TransactionListController.transactionsListController.transactionList
      .where(
    (element) {
      return element.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    },
  ).toList();
}
