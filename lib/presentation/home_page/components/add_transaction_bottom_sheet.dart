import 'package:despesas_pessoais/global/design_system/constants/sizes.dart';
import 'package:despesas_pessoais/global/design_system/widgets/box_spacer.dart';
import 'package:despesas_pessoais/controller/transaction_controller.dart';
import 'package:despesas_pessoais/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransation extends StatefulWidget {
  const AddTransation({super.key});

  @override
  State<AddTransation> createState() => _AddTransationState();
}

class _AddTransationState extends State<AddTransation> {
  String valueTranscation = '';
  String nameTransaction = '';
  DateTime datePicked = DateTime.now();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .6,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xff01061b),
                Color(0xff0c0b3e),
              ],
            ),
          ),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const BoxSpacer.xLarge(),
                    Text(
                      'Nova Transação',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                    ),
                    const BoxSpacer.xLarge(),
                    CustomTextFormField(
                      validatorMessage: 'informe o nome',
                      onSaved: (value) {
                        nameTransaction = value!;
                      },
                      title: 'descrição',
                    ),
                    const BoxSpacer(),
                    CustomTextFormField(
                      validatorMessage: 'Informe o valor',
                      textInputType: TextInputType.number,
                      onSaved: (value) {
                        valueTranscation = value!;
                      },
                      title: 'Valor (R\$)',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  children: [
                    Text(
                      'Data: ${DateFormat('d MMM y').format(datePicked).toString()}',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
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
                            pickedDate == null ? null : datePicked = pickedDate;
                          });
                        });
                      },
                      child: Text(
                        'Selecionar data',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Theme.of(context).highlightColor),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: Sizes.buttonHeigth,
                width: Sizes.buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    bool isValid = _formKey.currentState!.validate();
                    if (isValid) {
                      _formKey.currentState!.save();
                      TransactionListController.transactionsListController
                          .addTransaction(
                        nameTransaction,
                        double.parse(valueTranscation),
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
                    backgroundColor: Theme.of(context).highlightColor,
                    shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Sizes.radiusLarge),
                      ),
                    ),
                  ),
                  child: const Text('Adicionar'),
                ),
              ),
              const BoxSpacer.xxLarge()
            ],
          ),
        ),
      ),
    );
  }
}
