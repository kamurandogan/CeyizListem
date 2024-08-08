import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wedding_shopping_check/feature/stats/service/chart_data.dart';
import 'package:wedding_shopping_check/feature/stats/service/get_list_service.dart';
import 'package:wedding_shopping_check/models/product_model.dart';
import 'package:wedding_shopping_check/product/constans/strings.dart';

part '../mixin/pie_chart_mixin.dart';

class PieChart extends StatefulWidget {
  const PieChart({super.key});

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> with PieChartMixin {
  @override
  void initState() {
    GetPurchasedList.instance.getAllList().then((value) => initCalculateTotalPrice());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SfCircularChart(
      title: ChartTitle(text: 'Alınanlar'),
      legend: Legend(
        orientation: LegendItemOrientation.horizontal,
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        // shouldAlwaysShowScrollbar: true,
        // isResponsive: true,
        textStyle: TextStyle(fontSize: size.height * .02),
      ),
      series: <CircularSeries>[
        PieSeries<ChartData, String>(
          legendIconType: LegendIconType.circle,
          dataLabelSettings: DataLabelSettings(
            textStyle: TextStyle(
              fontSize: size.height * .018,
              fontWeight: FontWeight.bold,
            ),
            angle: 50,
            showZeroValue: false,
            isVisible: true,
          ),
          dataSource: _chartData,
          xValueMapper: (datum, index) => datum.name,
          yValueMapper: (datum, index) => datum.price,
        ),
      ],
    );
  }
}
