import 'package:e_commerce/data/models/create_reviews_data.dart';

class CreateReviewsModel {
  String? msg;
  CreateReviewsData? data;

  CreateReviewsModel({this.msg, this.data});

  CreateReviewsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = CreateReviewsData.fromJson(json['data']);
    } else {
      data = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}


