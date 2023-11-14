import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TransactionsChart extends StatelessWidget {
  final String title;
  final int amount;

  const TransactionsChart({
    Key? key,
    this.title = 'Debit & Credit',
    this.amount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300.0,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withOpacity(0.01),
              spreadRadius: 10,
              blurRadius: 3,
              // changes position of shadow
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color(0xff67727d),
                        ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "\$$amount.00",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: (MediaQuery.of(context).size.width - 20),
                height: (MediaQuery.of(context).size.height * 0.23),
                // height: 160,
                padding: EdgeInsets.only(bottom: 5.0),
                child: _chartBuilder(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _chartBuilder(BuildContext context) {
  return LineChart(txnData);
}

SideTitles get leftTitles => const SideTitles(
      getTitlesWidget: _leftTitleWidgets,
      showTitles: true,
      // interval: 1,
      reservedSize: 28,
    );

Widget _leftTitleWidgets(double value, TitleMeta meta) {
  return Text(
    '${value}k',
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xff67727d),
      fontSize: 12,
    ),
  );
}

SideTitles get bottomTitles => const SideTitles(
      showTitles: true,
      reservedSize: 22,
      // interval: 1,
      getTitlesWidget: _bottomTitleWidgets,
    );

Widget _bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
      fontWeight: FontWeight.bold, color: Color(0xff68737d), fontSize: 12);
  Widget text;
  switch (value.toInt()) {
    case 2:
      text = const Text('SEPT', style: style);
      break;
    case 7:
      text = const Text('OCT', style: style);
      break;
    case 12:
      text = const Text('DEC', style: style);
      break;
    default:
      text = const Text('');
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

LineChartData txnData = LineChartData(
  gridData: FlGridData(
      show: true,
      drawHorizontalLine: true,
      getDrawingHorizontalLine: (value) {
        return const FlLine(
          color: Color(0xff37434d),
          strokeWidth: 0.1,
        );
      }),
  borderData: FlBorderData(
    show: false,
  ),
  minX: 0,
  maxX: 11,
  minY: 0,
  maxY: 6,
  titlesData: FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(sideTitles: bottomTitles),
    leftTitles: AxisTitles(sideTitles: leftTitles),
  ),
  lineBarsData: [
    LineChartBarData(
      spots: const [
        FlSpot(1, 2.8),
        FlSpot(3, 1.9),
        FlSpot(6, 3),
        FlSpot(10, 1.3),
        FlSpot(12, 2.2),
        FlSpot(13, 2.5),
      ],
      isCurved: true,
      color: Colors.red,
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: const FlDotData(
        show: false,
      ),
    ),
    LineChartBarData(
      spots: const [
        FlSpot(1, 1),
        FlSpot(3, 4),
        FlSpot(5, 1.8),
        FlSpot(7, 5),
        FlSpot(10, 2),
        FlSpot(12, 2.2),
        FlSpot(13, 1.8),
      ],
      isCurved: true,
      color: Colors.blue,
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: const FlDotData(
        show: false,
      ),
    ),
  ],
);
