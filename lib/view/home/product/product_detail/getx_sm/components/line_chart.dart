import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:interview_project/core/constants/utils/colors/colors.dart';
import 'package:interview_project/view/home/product/product_detail/getx_sm/controller/product_detail_controller.dart';

class MyLineChart extends StatefulWidget {
  const MyLineChart({
    Key? key,
  }) : super(key: key);

  @override
  State<MyLineChart> createState() => _MyLineChartState();
}

class _MyLineChartState extends State<MyLineChart> {
  final ProductDetailController _controller =
      Get.put(ProductDetailController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      //represents whole graph
      () => LineChart(
        LineChartData(
          //disables titles both x and y axis
          titlesData: FlTitlesData(show: false),
          //disables borders both x and y axis
          borderData: FlBorderData(show: false),
          //disables grid view on graph
          gridData: FlGridData(show: false),
          //defines graph datas
          lineBarsData: [
            LineChartBarData(
              color: AppColors.mainGreen,
              shadow: const Shadow(
                blurRadius: 0.5,
                color: AppColors.mainGreen,
              ),
              //defines x and y axis values
              spots: _controller.theShownData
                  .map(
                    (e) => FlSpot(
                      double.parse(e!.d!.toString()),
                      double.parse(e.c!.toStringAsFixed(2)),
                    ),
                  )
                  .toList(),
              isCurved: false,
              //disables dot on data points
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
