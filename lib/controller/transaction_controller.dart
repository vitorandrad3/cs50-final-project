import 'dart:math';
import 'package:despesas_pessoais/controller/statistic_controller.dart';
import 'package:despesas_pessoais/domain/transaction_model.dart';
import 'package:flutter/widgets.dart';
import '../global/design_system/constants/numbers.dart';
import 'db.dart';

class TransactionListController extends ChangeNotifier {
  static TransactionListController transactionsListController =
      TransactionListController();

  List<MyTransaction> transactionList = [];

  getTransactions() async {
    transactionList = await TransactionDatabase.instance.getTransactions();
    notifyListeners();
  }

  Future<void> addTransaction(
      String name, double value, DateTime datePicked) async {
    MyTransaction newTransaction = MyTransaction(
      date: datePicked,
      id: Random().nextDouble().toString(),
      description: name,
      value: value,
    );

    await TransactionDatabase.instance.addTransaction(newTransaction);
    transactionList = await TransactionDatabase.instance.getTransactions();
    StatisticController.statisticController.initStatistic();
    getTransactionsOfLastSevenDayslist();
    notifyListeners();
  }

  Future<void> removeTransaction(int index) async {
    String id = transactionList[index].id;
    await TransactionDatabase.instance.removeTransaction(id);
    transactionList = await TransactionDatabase.instance.getTransactions();
    StatisticController.statisticController.initStatistic();
    getTransactionsOfLastSevenDayslist();
    notifyListeners();
  }

  List<MyTransaction> transactionsOfLastSevenDaysList = [];

  getTransactionsOfLastSevenDayslist() async {
    transactionsOfLastSevenDaysList = await transactionsOfLastSevenDays;
    notifyListeners();
  }

  get transactionsOfLastSevenDays async {
    List<MyTransaction> transactions =
        await TransactionDatabase.instance.getTransactions();
    return transactions.where(
      (element) {
        return element.date.isAfter(
          DateTime.now().subtract(
            const Duration(days: Numbers.weekDays),
          ),
        );
      },
    ).toList();
  }

  Future<List<MyTransaction>> get transactionsOfCurrentMonth async {
    List<MyTransaction> transactions =
        await TransactionDatabase.instance.getTransactions();
    return transactions.where(
      (transaction) {
        return (transaction.date.month == DateTime.now().month) &&
            (transaction.date.year == DateTime.now().year);
      },
    ).toList();
  }

  Future<List<MyTransaction>> get allTransactions async {
    transactionList = await TransactionDatabase.instance.getTransactions();
    return transactionList;
  }
}
