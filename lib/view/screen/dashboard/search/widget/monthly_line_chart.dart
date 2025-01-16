import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/view/screen/dashboard/search/widget/appcolors.dart';

class MonthlyLineChart extends StatelessWidget {
  final List<RupeeMateModel> data;

  const MonthlyLineChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final hasValidData = data.isNotEmpty && data.any((item) => (item.amount ?? 0) > 0);

    if (!hasValidData) {
      return Center(
        child: Text(
          'No data available to display',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      );
    }

    return LineChart(
      getLineChartData(),
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData getLineChartData() {
    final groupedData = groupDataByDay(data);
    final List<LineChartBarData> lineBars = createLineBars(groupedData);

    final maxYValue = groupedData.values
        .expand((list) => list)
        .map((spot) => spot.y)
        .reduce((a, b) => a > b ? a : b);

    return LineChartData(
      lineBarsData: lineBars,
      titlesData: titlesData,
      gridData: gridData,
      borderData: borderData,
      minX: 1,
      maxX: 31,
      minY: 0,
      maxY: maxYValue.isFinite ? maxYValue + 10 : 10,
    );
  }


  Map<String, List<FlSpot>> groupDataByDay(List<RupeeMateModel> data) {
    final Map<String, Map<double, double>> sumsByTypeAndDay = {
      'Credit': {},
      'Expense': {},
      'Debt': {},
      'Lend': {},
    };

    for (final item in data) {
      final String? type = item.type;
      final double? day = item.day?.toDouble();
      final double? amount = item.amount;

      if (type == null || day == null || amount == null) continue;
      sumsByTypeAndDay.putIfAbsent(type, () => {});
      sumsByTypeAndDay[type]![day] = (sumsByTypeAndDay[type]![day] ?? 0) + amount;
    }

    final Map<String, List<FlSpot>> groupedData = {};

    sumsByTypeAndDay.forEach((type, dayToSumMap) {
      if (dayToSumMap.isEmpty) {
        groupedData[type] = [const FlSpot(0, 0)];
      } else {
        groupedData[type] = dayToSumMap.entries
            .map((entry) => FlSpot(entry.key, entry.value))
            .toList()
          ..sort((a, b) => a.x.compareTo(b.x))
          ;
      }
    });

    return groupedData;
  }


  List<LineChartBarData> createLineBars(Map<String, List<FlSpot>> groupedData) {
    return [
      createLineChartBarData(groupedData['Credit'], AppColors.contentColorGreen),
      createLineChartBarData(groupedData['Expense'], AppColors.contentColorPink),
      createLineChartBarData(groupedData['Debt'], AppColors.contentColorCyan),
      createLineChartBarData(groupedData['Lend'], Colors.orange),
    ];
  }

  LineChartBarData createLineChartBarData(List<FlSpot>? spots, Color color) {
    return LineChartBarData(
      isCurved: true,
      color: color,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
      spots: spots ?? [],
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles,
    ),
    leftTitles: AxisTitles(
      sideTitles: leftTitles(),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: kWhite, fontWeight: FontWeight.bold, fontSize: 12);
    String text = '';

    if (value.toInt() == 1 || value.toInt() == 7 || value.toInt() == 14 || value.toInt() == 21 || value.toInt() == 28) {
      text = value.toInt().toString();
    } else {
      return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: kWhite, fontWeight: FontWeight.bold, fontSize: 12);
    return Text('${value.toInt()}', style: style);
  }

  SideTitles leftTitles() => SideTitles(
        showTitles: true,
        reservedSize: 40,
        getTitlesWidget: leftTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(show: true);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.black, width: 1),
          left: BorderSide(color: Colors.black, width: 1),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );
}
