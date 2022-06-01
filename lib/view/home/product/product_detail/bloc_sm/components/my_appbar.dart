import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grock/grock.dart';
import 'package:interview_project/view/home/product/product_detail/bloc_sm/cubit/product_detail_cubit.dart';

class MyAppbar extends StatefulWidget {
  const MyAppbar({Key? key}) : super(key: key);

  @override
  State<MyAppbar> createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.black,
            size: 30,
          ),
          onPressed: null,
        ).visible(false),
        Text(
          context.read<ProductDetailCubit>().datas!.symbol ?? "",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.w400,
            fontSize: 26,
          ),
        ),
        const IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.black,
            size: 30,
          ),
          onPressed: null,
        )
      ],
    );
  }
}
