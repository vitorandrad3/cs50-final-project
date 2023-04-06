import 'package:despesas_pessoais/global/design_system/constants/sizes.dart';
import 'package:despesas_pessoais/controller/statistic_controller.dart';
import 'package:flutter/material.dart';

import 'components/custom_drop_down.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Sizes.radiusMedium),
          bottomRight: Radius.circular(Sizes.radiusMedium),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Sizes.radiusLarge),
                  bottomRight: Radius.circular(Sizes.radiusLarge),
                  topRight: Radius.circular(Sizes.radiusSmall),
                ),
              ),
              height: Sizes.drawerHeaderSize,
              width: double.infinity,
              child: Image.asset(
                'assets/images/flutter_mascot.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: Sizes.paddingxMedium, left: Sizes.paddingMedium),
              child: Text(
                'Comportamento do gráfico:',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.paddingxMedium),
              child: Row(
                children: [
                  Text(
                    'Intervalo:',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: Sizes.paddingMedium),
                  CustomDropdown(
                    value: StatisticController.statisticController.chartType,
                    trueText: 'Semanal',
                    falseText: 'Mensal',
                    onChanged:
                        StatisticController.statisticController.changeChartType,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
