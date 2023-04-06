import 'package:despesas_pessoais/global/design_system/constants/spacing.dart';
import 'package:flutter/material.dart';

class BoxSpacer extends SizedBox {
  const BoxSpacer({super.key}) : super.square(dimension: ConstSpacing.medium);

  const BoxSpacer.xSmall({super.key})
      : super.square(dimension: ConstSpacing.xSmall);

  const BoxSpacer.small({super.key})
      : super.square(dimension: ConstSpacing.small);

  const BoxSpacer.large({super.key})
      : super.square(dimension: ConstSpacing.large);

  const BoxSpacer.xLarge({super.key})
      : super.square(dimension: ConstSpacing.xLarge);

  const BoxSpacer.xxLarge({super.key})
      : super.square(dimension: ConstSpacing.xxLarge);
}
