import 'package:e_commerce/data/models/cart_list_data.dart';

class CartListModels {
  String? msg;
  List<CartListData>? data;

  CartListModels({this.msg, this.data});

  CartListModels.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <CartListData>[];
      json['data'].forEach((v) {
        data!.add(CartListData.fromJson(v));
      });
    }
  }

}

