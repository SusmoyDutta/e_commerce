import 'package:e_commerce/data/models/slider_data.dart';

class SliderListModel {
  String? msg;
  List<CategoryList>? sliderList;

  SliderListModel({this.msg, this.sliderList});

  SliderListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      sliderList = <CategoryList>[];
      json['data'].forEach((v) {
        sliderList!.add(CategoryList.fromJson(v));
      });
    }
  }

}


