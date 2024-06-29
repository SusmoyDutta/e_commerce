import 'package:e_commerce/data/models/product_details_model.dart';

class ProductDetailsWrapperModel {
  String? msg;
  List<ProductDetailsModel>? productData;

  ProductDetailsWrapperModel({this.msg, this.productData});

  ProductDetailsWrapperModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productData = <ProductDetailsModel>[];
      json['data'].forEach((v) {
        productData!.add(ProductDetailsModel.fromJson(v));
      });
    }
  }

}






