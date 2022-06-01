import 'package:interview_project/view/home/product/product_detail/getx_sm/model/product_detail_model.dart';

abstract class ProductDetailState {
  const ProductDetailState();
}

class ProductDetailInitial extends ProductDetailState {
  ProductDetailInitial();
}

class ProductDetailLoading extends ProductDetailState {
  ProductDetailLoading();
}

class ProductDetailLoaded extends ProductDetailState {
  ProductDetailLoaded(this.product);
  final ProductDetail product;
}

class ProductDetailError extends ProductDetailState {
  ProductDetailError(this.message);
  final String message;
}

class ProductDetailChangeChartData extends ProductDetailState {
  ProductDetailChangeChartData(this.index);
  final int index;
}
