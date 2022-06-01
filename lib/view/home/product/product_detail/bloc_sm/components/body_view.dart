import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grock/grock.dart';
import 'package:interview_project/view/home/product/product_detail/bloc_sm/components/my_appbar.dart';
import 'package:interview_project/view/home/product/product_detail/bloc_sm/components/my_line_chartt.dart';
import 'package:interview_project/view/home/product/product_detail/bloc_sm/components/time_sequence_card2.dart';
import 'package:interview_project/view/home/product/product_detail/bloc_sm/cubit/product_detail_cubit.dart';
import 'package:interview_project/view/home/product/product_detail/getx_sm/components/time_sequence_divider.dart';

class BodyView extends StatefulWidget {
  const BodyView({Key? key}) : super(key: key);

  @override
  State<BodyView> createState() => _BodyViewState();
}

class _BodyViewState extends State<BodyView> {
  final List timeSequenceLabels = [
    "1G",
    "1H",
    "1A",
    "3A",
    "1Y",
    "5Y",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: context.top,
        ),
        const MyAppbar(),
        SizedBox(
          height: Grock.height - context.top - 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //represents line chart
              Center(
                child: SizedBox(
                  width: Grock.width - 20,
                  height: Grock.width / 2,
                  child: MyLineChartt(
                    product: context.watch<ProductDetailCubit>().shownData,
                  ),
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
                    return TimeSequenceCard2(
                      index: index,
                      title: timeSequenceLabels[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
