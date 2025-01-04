import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trackexpense/utils/colors.dart';
import 'package:trackexpense/view/screen/dashboard/search/widget/appcolors.dart';
import 'package:trackexpense/view/screen/dashboard/search/widget/indicator.dart';

class MonthlyPieChart extends StatefulWidget {
  final double credit;
  final double expense;
  final double lend;
  final double debt;

  const MonthlyPieChart({
    super.key,
    required this.credit,
    required this.expense,
    required this.lend,
    required this.debt,
  });

  @override
  State<StatefulWidget> createState() => MonthlyPieChartState();
}

class MonthlyPieChartState extends State<MonthlyPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: AppColors.contentColorPink,
                text: 'Expense',
                isSquare: true,
                textColor: kWhite,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: AppColors.contentColorGreen,
                text: 'Credit',
                isSquare: true,
                textColor: kWhite,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Colors.orange,
                text: 'Lend',
                isSquare: true,
                textColor: kWhite,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: AppColors.contentColorCyan,
                text: 'Debt',
                isSquare: true,
                textColor: kWhite,
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
  final total = widget.credit + widget.expense + widget.lend + widget.debt;

  if (total == 0) {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      final colors = [
        AppColors.contentColorPink,
        AppColors.contentColorGreen,
        Colors.orange,
        AppColors.contentColorCyan,
      ];

      return PieChartSectionData(
        color: colors[i],
        value: 25,
        title: '25%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: AppColors.mainTextColor1,
          shadows: shadows,
        ),
      );
    });
  }

  final creditPercentage = (widget.credit / total) * 100;
  final expensePercentage = (widget.expense / total) * 100;
  final lendPercentage = (widget.lend / total) * 100;
  final debtPercentage = (widget.debt / total) * 100;

  return List.generate(4, (i) {
    final isTouched = i == touchedIndex;
    final fontSize = isTouched ? 25.0 : 16.0;
    final radius = isTouched ? 60.0 : 50.0;
    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
    switch (i) {
      case 0:
        return PieChartSectionData(
          color: AppColors.contentColorPink,
          value: expensePercentage,
          title: '${expensePercentage.toStringAsFixed(1)}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.mainTextColor1,
            shadows: shadows,
          ),
        );
      case 1:
        return PieChartSectionData(
          color: AppColors.contentColorGreen,
          value: creditPercentage,
          title: '${creditPercentage.toStringAsFixed(1)}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.mainTextColor1,
            shadows: shadows,
          ),
        );
      case 2:
        return PieChartSectionData(
          color: Colors.orange,
          value: lendPercentage,
          title: '${lendPercentage.toStringAsFixed(1)}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.mainTextColor1,
            shadows: shadows,
          ),
        );
      case 3:
        return PieChartSectionData(
          color: AppColors.contentColorCyan,
          value: debtPercentage,
          title: '${debtPercentage.toStringAsFixed(1)}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.mainTextColor1,
            shadows: shadows,
          ),
        );
      default:
        throw Error();
    }
  });
}
}
