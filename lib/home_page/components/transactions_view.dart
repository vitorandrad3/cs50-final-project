// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:despesas_pessoais/controllers/statistic_controller.dart';
import 'package:despesas_pessoais/domain/transaction_model.dart';
import 'package:flutter/material.dart';

import '../../controllers/transaction_controller.dart';
import '../../widgets/custom_card.dart';

class TransactionsView extends StatefulWidget {
  const TransactionsView({super.key});

  @override
  State<TransactionsView> createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<TransactionsView> {
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
      height: MediaQuery.of(context).size.height * 0.38,
      child: TransactionListController
              .transactionsListController.transactionList.isEmpty
          ? Center(
              child: Column(
                children: [
                  const Text(
                    'Sem atividades registradas',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 150,
                    child: Image.asset('assets/images/no_activities_image.png'),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: TransactionListController
                  .transactionsListController.transactionList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    color: Theme.of(context).colorScheme.error,
                    child: const Center(
                      child: Text(
                        'EXCLUIR TRANSAÇÃO',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  key: ValueKey<Transaction>(TransactionListController
                      .transactionsListController.transactionList[index]),
                  onDismissed: (direction) => setState(() {
                    TransactionListController.transactionsListController
                        // ignore: invalid_use_of_protected_member
                        .notifyListeners();
                    TransactionListController
                        .transactionsListController.transactionList
                        .removeAt(index);
                  }),
                  child: CustomCard(
                    name: TransactionListController
                        .transactionsListController.transactionList[index].name,
                    value: TransactionListController.transactionsListController
                        .transactionList[index].value,
                    date: TransactionListController
                        .transactionsListController.transactionList[index].date,
                  ),
                );
              },
            ),
    );
  }
}
