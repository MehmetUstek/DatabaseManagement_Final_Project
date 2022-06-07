import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({Key? key, required this.dataMap}) : super(key: key);
  final Map<String, double> dataMap;

  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChartWidget> {
  late Map<String, double> dataMap;

  @override
  void initState() {
    super.initState();
    dataMap = widget.dataMap;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
        child: Container(
          child:PieChart(
            dataMap: dataMap,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 2,
            initialAngleInDegree: 0,
            chartType: ChartType.disc,
            colorList: [Colors.blue, Colors.pink, Colors.orange, Colors.purple, Colors.indigo, Colors.lime, Colors.orangeAccent],
            ringStrokeWidth: 32,
            centerText: "GENRES",
            legendOptions: LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: true,
              showChartValuesOutside: false,
              decimalPlaces: 1,
            ),
            // gradientList: ---To add gradient colors---
            // emptyColorGradient: ---Empty Color gradient---
          )
    ),
    ),
    );
  }

}