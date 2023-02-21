import 'package:despesas_pessoais/home_page/components/add_transaction.dart';
import 'package:despesas_pessoais/home_page/components/statistic_of_expenses.dart';
import 'package:despesas_pessoais/home_page/components/transactions_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor,
                const Color.fromARGB(255, 255, 167, 59),
              ],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 30),
              SizedBox(
                width: 190,
                height: 40,
                child: Card(
                  elevation: 10,
                  child: Center(
                    child: Text(
                      'Gastos nos últimos 7 dias',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const StatisticOfExpenses(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              const TransactionsView(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return const AddTransation();
                      },
                    );
                  },
                  child: const Text('Nova Transação')),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
