import 'package:despesas_pessoais/global/design_system/constants/sizes.dart';
import 'package:despesas_pessoais/controller/transaction_controller.dart';
import 'package:despesas_pessoais/presentation/home_page/components/add_transaction_bottom_sheet.dart';
import 'package:despesas_pessoais/presentation/home_page/components/custom_line_chart/custom_line_chart.dart';
import 'package:despesas_pessoais/presentation/home_page/components/last_transactions_view.dart';
import 'package:flutter/material.dart';

import '../../controller/statistic_controller.dart';
import 'components/custom_drawer/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorLight,
        child: const Icon(Icons.add_chart),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (builder) {
              return const AddTransation();
            },
          );
        },
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, __) => [
          AnimatedBuilder(
            animation: StatisticController.statisticController,
            builder: (context, child) {
              return SliverAppBar(
                title: StatisticController.statisticController.chartType
                    ? const Text('Gastos da semana')
                    : const Text('Gastos do mês'),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: Sizes.paddingxMedium, right: Sizes.paddingxMedium),
                    child: AnimatedBuilder(
                      animation:
                          TransactionListController.transactionsListController,
                      builder: (context, child) {
                        return Text(
                          StatisticController.statisticController.chartType
                              ? 'Total:  R\$${StatisticController.statisticController.sumOfWeekValues().toStringAsFixed(2)}'
                              : 'Total:  R\$${StatisticController.statisticController.sumOfMonthValues().toStringAsFixed(2)}',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.white70),
                        );
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Sizes.chartContainerHeigth,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(Sizes.radiusMedium),
                    bottomRight: Radius.circular(Sizes.radiusMedium),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColorLight,
                    ],
                  ),
                ),
                child: const CustomLineChart(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: Sizes.paddingMedium,
                    top: Sizes.paddingxLarge,
                    bottom: Sizes.paddingxMedium),
                child: Text(
                  'Últimas Transações',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const TransactionsView(),
            ],
          ),
        ),
      ),
    );
  }
}
