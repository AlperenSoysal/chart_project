import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:interview_project/view/home/product/product_detail/getx_sm/model/product_detail_model.dart';

abstract class ProductDetailServiceCubit {
  Future<ProductDetail?> fetch();
}

class SampleProductDetailServiceCubit implements ProductDetailServiceCubit {
  @override
  Future<ProductDetail?> fetch() async {
    final dio = Dio();
    String url = "https://finfree.app/demo";
    var response = await dio.get(
      url,
      options: Options(
        headers: {
          'Accept': 'application/json',
          "Authorization": "R29vZCBMdWNr"
        },
      ),
    );
    if (response.statusCode == 200) {
      return ProductDetail.fromJson(jsonDecode(response.data));
      // print(dataaaa.the1G!.length);
    } else {
      return null;
    }
    // print("status code --> ${response.statusCode}");
    // print("response data --> ${response.data}");
  }
}
