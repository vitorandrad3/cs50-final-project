import 'package:flutter/material.dart';

class StatisticBar extends StatelessWidget {
  const StatisticBar({
    super.key,
    required this.day,
    required this.percent,
    required this.value,
  });

  final String day;
  final double percent;
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 66,
      child: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: 20,
            child: FittedBox(
              child: Text(
                'R\$ ${value.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 80,
            width: 12,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percent.isNaN ? 0 : percent,
                  child: Container(
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(4.2),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Text(day),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
