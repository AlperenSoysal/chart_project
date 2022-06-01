import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_project/view/home/product/product_detail/bloc_sm/components/body_view.dart';
import 'package:interview_project/view/home/product/product_detail/bloc_sm/cubit/product_detail_cubit.dart';
import 'package:interview_project/view/home/product/product_detail/bloc_sm/service/service.dart';
import 'package:interview_project/view/home/product/product_detail/bloc_sm/state/product_detail_states.dart';

class ProductDetailViewBloc extends StatefulWidget {
  const ProductDetailViewBloc({Key? key}) : super(key: key);

  @override
  State<ProductDetailViewBloc> createState() => _ProductDetailViewBlocState();
}

class _ProductDetailViewBlocState extends State<ProductDetailViewBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDetailCubit(SampleProductDetailServiceCubit()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<ProductDetailCubit, ProductDetailState>(
          listener: (context, state) {
            if (state is ProductDetailError) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is ProductDetailLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductDetailInitial) {
              context.read<ProductDetailCubit>().fetchData();

              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductDetailLoaded) {
              return const BodyView();
            } else if (state is ProductDetailChangeChartData) {
              return const BodyView();
            } else {
              return Center(
                child: Text((state as ProductDetailError).message),
              );
            }
          },
        ),
      ),
    );
  }
}
