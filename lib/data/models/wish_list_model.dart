import 'package:e_commerce/data/models/wish_list_data.dart';

class WishListModel {
  String? msg;
  List<WishListData>? data;

  WishListModel({this.msg, this.data});

  WishListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <WishListData>[];
      json['data'].forEach((v) {
        data!.add(WishListData.fromJson(v));
      });
    }
  }


}



