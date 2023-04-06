import 'package:despesas_pessoais/domain/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(0, 1),
          )
        ],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(60),
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Valor:',
                  style: textTheme.titleSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                Text(
                  'R\$ ${transaction.value.toStringAsFixed(2)}',
                  style: textTheme.headlineSmall!.copyWith(
                    color: const Color(0xff2b72a2),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Data:',
                  style: textTheme.titleSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                Text(
                  DateFormat('d MMM y').format(transaction.date),
                  style: textTheme.bodySmall!.copyWith(
                    color: const Color(0xff2b72a2).withOpacity(.7),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: VerticalDivider(
                thickness: 1,
              )),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Descrição:',
                  style: textTheme.titleSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 150,
                  child: Text(
                    transaction.description,
                    overflow: TextOverflow.clip,
                    style: textTheme.caption!.copyWith(
                      color: const Color(0xff2b72a2),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
