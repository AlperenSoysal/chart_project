import 'package:get/get.dart';
import 'package:interview_project/view/home/product/product_detail/getx_sm/model/product_detail_model.dart';
import 'package:interview_project/view/home/product/product_detail/getx_sm/service/service.dart';

class ProductDetailController extends GetxController {
  //every variable represents its time sequence data list
  RxList<ProductDetailData?> the1G = <ProductDetailData>[].obs;
  RxList<ProductDetailData?> the1H = <ProductDetailData>[].obs;
  RxList<ProductDetailData?> the1A = <ProductDetailData>[].obs;
  RxList<ProductDetailData?> the3A = <ProductDetailData>[].obs;
  RxList<ProductDetailData?> the1Y = <ProductDetailData>[].obs;
  RxList<ProductDetailData?> the5Y = <ProductDetailData>[].obs;
  RxList<ProductDetailData?> theShownData = <ProductDetailData>[].obs;

  RxString companyLabel = "".obs;

  RxBool productDetailStatus = false.obs;

  void fetchProductDetail() {
    ProductDetailService.fetch().then((value) {
      if (value != null) {
        productDetailStatus.value = true;
        //set datas for each time sequence and shown data list
        the1G.value = value.the1G!;
        the1H.value = value.the1H!;
        the1A.value = value.the1A!;
        the3A.value = value.the3A!;
        the1Y.value = value.the1Y!;
        the5Y.value = value.the5Y!;
        theShownData.value = value.the1G!;
        companyLabel.value = value.symbol!;
      } else {
        productDetailStatus.value = false;
      }
    });
  }

  //this function changes datas on line chart according to selected time sequence
  void swithTimeSequence({required int index}) {
    switch (index) {
      case 0:
        theShownData.value = the1G;
        break;
      case 1:
        theShownData.value = the1H;
        break;
      case 2:
        theShownData.value = the1A;
        break;
      case 3:
        theShownData.value = the3A;
        break;
      case 4:
        theShownData.value = the1Y;
        break;
      case 5:
        theShownData.value = the5Y;
        break;
      default:
        break;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProductDetail();
    super.onInit();
  }
}
