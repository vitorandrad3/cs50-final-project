import 'package:despesas_pessoais/global/design_system/constants/sizes.dart';
import 'package:despesas_pessoais/controller/statistic_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../controller/transaction_controller.dart';
import 'components/chart_datas.dart';

class CustomLineChart extends StatefulWidget {
  const CustomLineChart({super.key});

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
  @override
  void initState() {
    super.initState();
    TransactionListController.transactionsListController.addListener(() {
      setState(() {});
    });

    StatisticController.statisticController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: Sizes.paddingxMedium,
        left: Sizes.paddingSmall,
        top: Sizes.paddingxMedium,
        bottom: Sizes.paddingLarge,
      ),
      child: LineChart(StatisticController.statisticController.chartType
          ? weekChartData()
          : monthChartData()),
    );
  }
}
