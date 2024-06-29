import 'package:e_commerce/data/models/review_by_product_data.dart';

class ReviewByProductModel {
  String? msg;
  List<ReviewByProductData>? data;

  ReviewByProductModel({this.msg, this.data});

  ReviewByProductModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ReviewByProductData>[];
      json['data'].forEach((v) {
        data!.add(ReviewByProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Profile {
  int? id;
  String? cusName;

  Profile({this.id, this.cusName});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cusName = json['cus_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cus_name'] = cusName;
    return data;
  }
}
