import 'package:despesas_pessoais/global/design_system/constants/sizes.dart';
import 'package:despesas_pessoais/global/design_system/widgets/box_spacer.dart';
import 'package:despesas_pessoais/domain/transaction_model.dart';
import 'package:flutter/material.dart';
import '../../../controller/transaction_controller.dart';
import '../../../global/design_system/widgets/custom_card.dart';

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
    bool isTranscationsEmpty = TransactionListController
        .transactionsListController.transactionList.isEmpty;
    return SizedBox(
      height: isTranscationsEmpty
          ? Sizes.transactionsViewHeigthLarge
          : TransactionListController.transactionsListController
                  .transactionsOfLastSevenDaysList.length *
              Sizes.transactionsViewHeigthLarge,
      child: isTranscationsEmpty
          ? Center(
              child: Column(
                children: [
                  const BoxSpacer.xLarge(),
                  Text(
                    'Sem transações nos últimos 7 dias',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: const Color(0xff0e5382),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: Sizes.imageHeigth,
                    child: Image.asset('assets/images/no_activities_image.png'),
                  )
                ],
              ),
            )
          : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: TransactionListController
                  .transactionsListController.transactionList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: Sizes.paddingSmall),
                  child: Dismissible(
                    background: Container(
                      color: Theme.of(context).colorScheme.error,
                      child: const Padding(
                        padding: EdgeInsets.only(
                            top: Sizes.paddingxLarge,
                            left: Sizes.paddingMedium),
                        child: Text(
                          'EXCLUIR TRANSAÇÃO',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    key: ValueKey<MyTransaction>(TransactionListController
                        .transactionsListController.transactionList[index]),
                    onDismissed: (direction) => setState(
                      () {
                        TransactionListController.transactionsListController
                            .removeTransaction(index);

                        TransactionListController
                            .transactionsListController.transactionList
                            .removeAt(index);
                      },
                    ),
                    child: CustomCard(
                      transaction: TransactionListController
                          .transactionsListController.transactionList[index],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
