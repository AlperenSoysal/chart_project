import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:interview_project/core/constants/utils/colors/colors.dart';
import 'package:interview_project/view/home/product/product_detail/bloc_sm/cubit/product_detail_cubit.dart';
import 'package:interview_project/view/home/product/product_detail/bloc_sm/provider/selected_index_provider.dart';

class TimeSequenceCard2 extends ConsumerWidget {
  final int index;
  final String title;
  const TimeSequenceCard2({Key? key, required this.index, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GrockContainer(
      onTap: () {
        // _selectedIndex.value = index;
        ref.read(selectedIndexProvider.state).state = index;
        context.read<ProductDetailCubit>().switchData(index: index);
      },
      alignment: Alignment.center,
      width: (Grock.width - (13 * 10)) / 6,
      height: 30,
      decoration: BoxDecoration(
        color: ref.watch(selectedIndexProvider) == index
            ? AppColors.mainGreen
            : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: ref.watch(selectedIndexProvider) == index
              ? Colors.white
              : Colors.grey.withOpacity(0.6),
          fontSize: 18,
        ),
      ),
    );
  }
}
