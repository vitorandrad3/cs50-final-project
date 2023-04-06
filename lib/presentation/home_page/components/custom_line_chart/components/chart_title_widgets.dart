import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget weekBottomTitleWidgets(
  double value,
  TitleMeta meta,
) {
  TextStyle textStyle = TextStyle(
    fontSize: 12,
    color: Colors.white.withOpacity(.8),
  );
  TextStyle textStylefForCurrentDay = const TextStyle(
    fontSize: 12,
    color: Color(0xff08c4ad),
  );

  Widget text;
  switch (value.toInt()) {
    case 1:
      text = Text(
        'Seg',
        style:
            DateTime.now().weekday == 1 ? textStylefForCurrentDay : textStyle,
      );
      break;
    case 2:
      text = Text(
        'Ter',
        style:
            DateTime.now().weekday == 2 ? textStylefForCurrentDay : textStyle,
      );
      break;
    case 3:
      text = Text(
        'Qua',
        style:
            DateTime.now().weekday == 3 ? textStylefForCurrentDay : textStyle,
      );
      break;
    case 4:
      text = Text(
        'Qui',
        style:
            DateTime.now().weekday == 4 ? textStylefForCurrentDay : textStyle,
      );
      break;
    case 5:
      text = Text(
        'Sex',
        style:
            DateTime.now().weekday == 5 ? textStylefForCurrentDay : textStyle,
      );
      break;
    case 6:
      text = Text(
        'Sáb',
        style:
            DateTime.now().weekday == 6 ? textStylefForCurrentDay : textStyle,
      );
      break;
    case 7:
      text = Text(
        'Dom',
        style:
            DateTime.now().weekday == 7 ? textStylefForCurrentDay : textStyle,
      );
      break;
    default:
      text = const Text('');
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget monthBottomTitleWidgets(
  double value,
  TitleMeta meta,
) {
  TextStyle textStyle = TextStyle(
    fontSize: 12,
    color: Colors.white.withOpacity(.8),
  );

  Widget text;
  switch (value.toInt()) {
    case 1:
      text = Text(
        '1',
        style: textStyle,
      );
      break;
    case 5:
      text = Text(
        '5',
        style: textStyle,
      );
      break;
    case 10:
      text = Text(
        '10',
        style: textStyle,
      );

      break;
    case 15:
      text = Text(
        '15',
        style: textStyle,
      );
      break;
    case 20:
      text = Text(
        '20',
        style: textStyle,
      );
      break;
    case 25:
      text = Text(
        '25',
        style: textStyle,
      );
      break;
    case 30:
      text = Text(
        '30',
        style: textStyle,
      );
      break;
    default:
      text = const Text('');
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
    color: Colors.white,
  );
  String text;
  switch (value.toInt()) {
    case 100:
      text = '100';
      break;
    case 500:
      text = '500';
      break;
    case 1000:
      text = '1000+';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}
