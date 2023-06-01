import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


  class ChartWidget extends StatefulWidget {

   List<dynamic> data=[];

   ChartWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(

          child: Scaffold(

            body: Center(
              child: SizedBox(
                height: 370,
                width: 370,
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(enabled: false),
                    titlesData: FlTitlesData(
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'Day 1';
                            case 1:
                              return 'Day 2';
                            case 2:
                              return 'Day 3';
                            case 3:
                              return 'Day 4';
                            case 4:
                              return 'Day 5';
                            case 5:
                              return 'Day 6';
                            case 6:
                              return 'Day 7';
                            default:
                              return '';
                          }
                        },
                      ),
                    ),
                    borderData: FlBorderData(
                      border: Border.all(color: Colors.black),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, widget.data[0]),
                          FlSpot(1, widget.data[1]),
                          FlSpot(2, widget.data[2]),
                          FlSpot(3, widget.data[3]),
                          FlSpot(4, widget.data[4]),
                          FlSpot(5, widget.data[5]),
                          FlSpot(6, widget.data[6]),
                        ],
                        isCurved: false,
                        colors: [Colors.blue],
                        barWidth: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

    );
  }

}
