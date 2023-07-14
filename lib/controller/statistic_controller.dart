import 'package:despesas_pessoais/global/design_system/constants/numbers.dart';
import 'package:despesas_pessoais/controller/transaction_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../domain/transaction_model.dart';

class StatisticController extends ChangeNotifier {

  static StatisticController statisticController = StatisticController();

  List<FlSpot> weekChartData = [];

  getWeekChartData() async {
    final List<MyTransaction> transactionsOfLastSevenDays =
        await TransactionListController
            .transactionsListController.transactionsOfLastSevenDays;

    final currentWeekDay = DateTime.now().weekday;
    weekChartData = List.generate(
      currentWeekDay,
      (index) {
        final lastestWeekday = DateTime.now().subtract(
          Duration(days: index),
        );
        return FlSpot(
          lastestWeekday.weekday.toDouble(),
          sumOfDayValues(transactionsOfLastSevenDays, lastestWeekday),
        );
      },
    );
    notifyListeners();
  }

  List<FlSpot> monthChartData = [];

  getMonthChartData() async {
    final transactionsOfCurrentMonth = await TransactionListController
        .transactionsListController.transactionsOfCurrentMonth;

    final currentMonthDay = DateTime.now().day;
    monthChartData = List.generate(
      currentMonthDay,
      (index) {
        final lastestMonthDay = DateTime.now().subtract(
          Duration(days: index),
        );
        return FlSpot(
          lastestMonthDay.day.toDouble(),
          sumOfDayValues(transactionsOfCurrentMonth, lastestMonthDay),
        );
      },
    );
    notifyListeners();
  }

  double sumOfDayValues(
      List<MyTransaction> recentTransactions, currentWeekDay) {
    double totalSumDay = Numbers.initVarialble;
    for (int i = 0; i < recentTransactions.length; i++) {
      bool sameDay = recentTransactions[i].date.day == currentWeekDay.day;

      if (sameDay) {
        totalSumDay += recentTransactions[i].value;
      }
    }

    return totalSumDay > Numbers.chartMaxValue
        ? Numbers.chartMaxValue
        : totalSumDay;
  }

  double sumOfWeekValues = 0;

  getSumOfWeekValues() async {
    double totalSumWeek = Numbers.initVarialble;
    final transactions = await TransactionListController
        .transactionsListController.transactionsOfLastSevenDays;
    for (int i = 0; i < transactions.length; i++) {
      if (isSameWeek(transactions[i].date, DateTime.now())) {
        totalSumWeek += transactions[i].value;
      }
    }

    sumOfWeekValues = totalSumWeek;
  }

  bool isSameWeek(DateTime date1, DateTime date2) {
    final diff = (date1.difference(date2).inDays).abs();

    if (diff ~/ Numbers.weekDays == 0 && date1.weekday <= date2.weekday) {
      return true;
    } else if (diff ~/ Numbers.weekDays == 1 &&
        date1.weekday >= date2.weekday) {
      return true;
    } else {
      return false;
    }
  }

  double sumOfMonthValues = 0;

  getSumOfMonthValues() async {
    final transactionsOfCurrentMonth = await TransactionListController
        .transactionsListController.transactionsOfCurrentMonth;

    double totalMonthWeek = 0;
    for (int i = 0; i < transactionsOfCurrentMonth.length; i++) {
      totalMonthWeek += transactionsOfCurrentMonth[i].value;
    }

    sumOfMonthValues = totalMonthWeek;
  }

  bool chartType = true;

  void changeChartType(value) {
    chartType = value;
    notifyListeners();
  }

  initStatistic() {
    getSumOfMonthValues();
    getSumOfWeekValues();
    getMonthChartData();
    getWeekChartData();
    notifyListeners();
  }
}
