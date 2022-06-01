import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_project/view/home/product/product_detail/bloc_sm/cubit/product_detail_cubit.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String? title;

  final bool hasTrail;
  final Function? actionFunction;
  CustomAppBar({
    Key? key,
    this.title,
    this.hasTrail = false,
    this.actionFunction,
  }) : preferredSize =
            const Size.fromHeight(56.0); //change this for appbar height
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (ctx, state) {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        //this is buy/sell stock button
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            ),
            onPressed: actionFunction?.call(),
          ),
        ],
        title: Text(
          ctx.watch<ProductDetailCubit>().datas!.symbol ?? "",
          style: const TextStyle(
              color: Colors.black45, fontWeight: FontWeight.w400),
        ),
      );
    });
  }
}
