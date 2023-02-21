import 'package:despesas_pessoais/controllers/statistic_controller.dart';
import 'package:despesas_pessoais/controllers/transaction_controller.dart';
import 'package:despesas_pessoais/widgets/statistic_bar.dart';
import 'package:flutter/material.dart';

class StatisticOfExpenses extends StatefulWidget {
  const StatisticOfExpenses({super.key});

  @override
  State<StatisticOfExpenses> createState() => _StatisticOfExpensesState();
}

class _StatisticOfExpensesState extends State<StatisticOfExpenses> {
  @override
  void initState() {
    super.initState();
    TransactionListController.transactionsListController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        elevation: 10,
        child: Row(
          children: [
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: StatisticController
                    .statisticController.statisticList.length,
                itemBuilder: (context, index) {
                  return StatisticBar(
                    day: StatisticController
                        .statisticController.statisticList[index]['day']
                        .toString(),
                    percent: double.parse(StatisticController
                        .statisticController.statisticList[index]['percent']
                        .toString()),
                    value: double.parse(StatisticController
                        .statisticController.statisticList[index]['value']
                        .toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
