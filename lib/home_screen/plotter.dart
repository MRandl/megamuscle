import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

//initially from https://github.com/imaNNeo/fl_chart/blob/master/example/lib/presentation/samples/line/line_chart_sample1.dart

class _WeightPlot extends StatelessWidget {
  const _WeightPlot(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartBarData lineChartBarData1_1(Color color) {
    return LineChartBarData(
      isCurved: true,
      color: color,
      barWidth: 6,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
      spots: const [
        FlSpot(1, 1),
        FlSpot(3, 1.5),
        FlSpot(5, 1.4),
        FlSpot(7, 3.4),
        FlSpot(10, 2),
        FlSpot(12, 2.2),
        FlSpot(13, 1.8),
      ],
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: const FlGridData(show: true),
        titlesData: const FlTitlesData(
            show: true,
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 30))),
        borderData: borderData,
        lineBarsData: [lineChartBarData1_1(color)],
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );
}

FlBorderData get borderData => FlBorderData(
      show: false,
      border: const Border(
        bottom: BorderSide(color: Colors.black),
        left: BorderSide(color: Colors.black),
        right: BorderSide(color: Colors.black),
        top: BorderSide(color: Colors.black),
      ),
    );

class SamplePlot extends StatefulWidget {
  const SamplePlot({super.key, required this.color});

  final Color color;

  @override
  State<StatefulWidget> createState() => SamplePlotState();
}

class SamplePlotState extends State<SamplePlot> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: _WeightPlot(widget.color),
        ),
      ],
    );
  }
}
