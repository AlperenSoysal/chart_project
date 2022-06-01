import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_project/view/home/product/product_detail/bloc_sm/service/service.dart';
import 'package:interview_project/view/home/product/product_detail/bloc_sm/state/product_detail_states.dart';
import 'package:interview_project/view/home/product/product_detail/getx_sm/model/product_detail_model.dart';
import 'package:interview_project/view/home/product/product_detail/getx_sm/service/service.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final SampleProductDetailServiceCubit _service;
  ProductDetailCubit(this._service) : super(ProductDetailInitial());
  late ProductDetail? datas;
  late List<ProductDetailData?>? shownData;

  Future<void> fetchData() async {
    try {
      emit(ProductDetailLoading());
      datas = await _service.fetch();
      emit(ProductDetailLoaded(datas!));
      shownData = datas!.the1G;
    } catch (e) {
      emit(ProductDetailError(e.toString()));
    }
  }

  Future switchData({required int index}) async {
    print("erfg");
    emit(ProductDetailChangeChartData(index));
    switch (index) {
      case 0:
        shownData = datas!.the1G;
        break;
      case 1:
        shownData = datas!.the1H;
        break;
      case 2:
        shownData = datas!.the1A;
        break;
      case 3:
        shownData = datas!.the3A;
        break;
      case 4:
        shownData = datas!.the1Y;
        break;
      case 5:
        shownData = datas!.the5Y;
        break;
      default:
        break;
    }
    return Future.value(true);
  }
}
