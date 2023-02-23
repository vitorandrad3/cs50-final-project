import 'package:despesas_pessoais/controllers/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../domain/transaction_model.dart';

class StatisticController extends ChangeNotifier {
  static StatisticController statisticController = StatisticController();

  List<Map<String, Object>> get statisticList {
    return List.generate(
      7,
      (index) {
        final currentWeekDay = DateTime.now().subtract(
          Duration(days: index),
        );

        return {
          'day': DateFormat.E().format(currentWeekDay),
          'value': sumOfDayValues(recentTransactions, currentWeekDay),
          'percent': sumOfDayValues(recentTransactions, currentWeekDay) /
              sumOfWeekValues(recentTransactions, currentWeekDay)
        };
      },
    );
  }

  double sumOfDayValues(List<Transaction> recentTransactions, currentWeekDay) {
    double totalSumDay = 0;
    for (int i = 0; i < recentTransactions.length; i++) {
      bool sameDay = recentTransactions[i].date.day == currentWeekDay.day;

      if (sameDay) {
        totalSumDay += recentTransactions[i].value;
      }
    }

    return totalSumDay;
  }

  double sumOfWeekValues(
      List<Transaction> recentTransactions, DateTime currentWeekDay) {
    double totalSumWeek = 0;
    for (int i = 0; i < recentTransactions.length; i++) {
      totalSumWeek += recentTransactions[i].value;
    }

    return totalSumWeek;
  }
}
