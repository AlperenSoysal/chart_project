import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grock/grock.dart';
import 'package:interview_project/core/components/custom_appbar.dart';
import 'package:interview_project/core/constants/utils/colors/colors.dart';
import 'package:interview_project/view/home/product/product_detail/getx_sm/components/line_chart.dart';
import 'package:interview_project/view/home/product/product_detail/getx_sm/components/time_sequence_divider.dart';
import 'package:interview_project/view/home/product/product_detail/getx_sm/controller/product_detail_controller.dart';

class ProductDetailViewGetX extends StatelessWidget {
  ProductDetailViewGetX({Key? key}) : super(key: key);
  final ProductDetailController _controller =
      Get.put(ProductDetailController());

  final List timeSequenceLabels = [
    "1G",
    "1H",
    "1A",
    "3A",
    "1Y",
    "5Y",
  ];

  RxInt _selectedIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: _controller.companyLabel.value),
        //if status false show loading else show chart
        body: _controller.productDetailStatus.isFalse
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  //represents line chart
                  Center(
                    child: SizedBox(
                      width: Grock.width - 20,
                      height: Grock.width / 2,
                      child: const MyLineChart(),
                    ),
                  ),
                  const SizedBox(height: 50),
                  // represents time sequence options
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                      padding: 10.horizontalP,
                      scrollDirection: Axis.horizontal,
                      itemCount: timeSequenceLabels.length,
                      separatorBuilder: (ct, index) {
                        return const CustomDivider();
                      },
                      itemBuilder: (ct, index) {
                        return Obx(
                          () => timeSequenceCard(
                              label: timeSequenceLabels[index], index: index),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  //this returns the time sequence option card
  Widget timeSequenceCard({required String label, required int index}) {
    return GrockContainer(
      onTap: () {
        _selectedIndex.value = index;

        _controller.swithTimeSequence(index: index);
      },
      alignment: Alignment.center,
      width: (Grock.width - (13 * 10)) / 6,
      height: 30,
      decoration: BoxDecoration(
        color:
            index == _selectedIndex.value ? AppColors.mainGreen : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: index == _selectedIndex.value
              ? Colors.white
              : Colors.grey.withOpacity(0.6),
          fontSize: 18,
        ),
      ),
    );
  }
}
