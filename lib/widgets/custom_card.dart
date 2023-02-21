import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key, required this.name, required this.value, required this.date});

  final String name;
  final double value;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Container(
            width: 90,
            height: 90,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white70, width: 4),
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
            child: FittedBox(
              child: Text(
                'R\$ ${value.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white70),
              ),
            ),
          ),
          const SizedBox(
            width: 70,
          ),
          Flexible(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  name,
                  style: const TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Text(
                  'Data: ${DateFormat('d MMM y').format(date)}',
                  style: const TextStyle(fontSize: 10),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
