import 'dart:math';
import 'package:despesas_pessoais/domain/transaction_model.dart';
import 'package:flutter/widgets.dart';

import '../global/design_system/constants/numbers.dart';

class TransactionListController extends ChangeNotifier {
  static TransactionListController transactionsListController =
      TransactionListController();

  List<Transaction> transactionList = [];

  addTransaction(String name, double value, DateTime datePicked) {
    Transaction newTransaction = Transaction(
        date: datePicked,
        id: Random().nextDouble().toString(),
        description: name,
        value: value);

    transactionList.add(newTransaction);
    notifyListeners();
  }

  void removeTransaction(int index) {
    transactionList.removeAt(index);
    notifyListeners();
  }

  List<Transaction> get transactionsOfLastSevenDays {
    return TransactionListController.transactionsListController.transactionList
        .where(
      (element) {
        return element.date.isAfter(
          DateTime.now().subtract(
            const Duration(days: Numbers.weekDays),
          ),
        );
      },
    ).toList();
  }

  List<Transaction> get transactionsOfCurrentMonth {
    return TransactionListController.transactionsListController.transactionList
        .where(
      (transaction) {
        return (transaction.date.month == DateTime.now().month) &&
            (transaction.date.year == DateTime.now().year);
      },
    ).toList();
  }
}
