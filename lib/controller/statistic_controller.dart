import 'package:despesas_pessoais/global/design_system/constants/numbers.dart';
import 'package:despesas_pessoais/controller/transaction_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../domain/transaction_model.dart';

class StatisticController extends ChangeNotifier {
  static StatisticController statisticController = StatisticController();

  List<FlSpot> get weekChartData {
    final currentWeekDay = DateTime.now().weekday;
    return List.generate(
      currentWeekDay,
      (index) {
        final lastestWeekday = DateTime.now().subtract(
          Duration(days: index),
        );
        return FlSpot(
          lastestWeekday.weekday.toDouble(),
          sumOfDayValues(
              TransactionListController
                  .transactionsListController.transactionsOfLastSevenDays,
              lastestWeekday),
        );
      },
    );
  }

  List<FlSpot> get monthChartData {
    final currentMonthDay = DateTime.now().day;
    return List.generate(
      currentMonthDay,
      (index) {
        final lastestMonthDay = DateTime.now().subtract(
          Duration(days: index),
        );
        return FlSpot(
          lastestMonthDay.day.toDouble(),
          sumOfDayValues(
              TransactionListController
                  .transactionsListController.transactionsOfCurrentMonth,
              lastestMonthDay),
        );
      },
    );
  }

  double sumOfDayValues(List<Transaction> recentTransactions, currentWeekDay) {
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

  double sumOfWeekValues() {
    double totalSumWeek = Numbers.initVarialble;
    for (int i = 0;
        i <
            TransactionListController
                .transactionsListController.transactionsOfLastSevenDays.length;
        i++) {
      if (isSameWeek(
          TransactionListController
              .transactionsListController.transactionsOfLastSevenDays[i].date,
          DateTime.now())) {
        totalSumWeek += TransactionListController
            .transactionsListController.transactionsOfLastSevenDays[i].value;
      }
    }

    return totalSumWeek;
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

  double sumOfMonthValues() {
    double totalMonthWeek = 0;
    for (int i = 0;
        i <
            TransactionListController
                .transactionsListController.transactionsOfCurrentMonth.length;
        i++) {
      totalMonthWeek += TransactionListController
          .transactionsListController.transactionsOfCurrentMonth[i].value;
    }

    return totalMonthWeek;
  }

  bool chartType = true;

  void changeChartType(value) {
    chartType = value;
    notifyListeners();
  }
}
