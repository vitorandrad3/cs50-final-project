import 'package:despesas_pessoais/controllers/transaction_controller.dart';
import 'package:despesas_pessoais/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransation extends StatefulWidget {
  const AddTransation({super.key});

  @override
  State<AddTransation> createState() => _AddTransationState();
}

class _AddTransationState extends State<AddTransation> {
  String valueObject = '';
  String nameObject = '';
  DateTime datePicked = DateTime.now();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.56,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Adicione uma transação'),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      validatorMessage: 'informe o nome',
                      onSaved: (value) {
                        nameObject = value!;
                      },
                      title: 'Nome',
                    ),
                    CustomTextFormField(
                      validatorMessage: 'Informe o valor',
                      textInputType: TextInputType.number,
                      onSaved: (value) {
                        valueObject = value!;
                      },
                      title: 'Valor (R\$)',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.88,
                child: Row(
                  children: [
                    Text(
                        'Data: ${DateFormat('d MMM y').format(datePicked).toString()}'),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime.now(),
                          ).then((pickedDate) {
                            return setState(() {
                              pickedDate == null
                                  ? null
                                  : datePicked = pickedDate;
                            });
                          });
                        },
                        child: const Text(
                          'Selecionar data',
                        ))
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 40,
                width: 130,
                child: ElevatedButton(
                  onPressed: () {
                    bool isValid = _formKey.currentState!.validate();
                    if (isValid) {
                      _formKey.currentState!.save();
                      TransactionListController.transactionsListController
                          .addTransaction(
                        nameObject,
                        double.parse(valueObject),
                        datePicked,
                      );
                      _formKey.currentState!.reset();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Transação adicionada com sucesso!'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  child: const Text('Adicionar'),
                ),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
