import 'package:e_commerce/data/%20utilits/urls.dart';
import 'package:e_commerce/data/models/network_response.dart';

import 'package:e_commerce/data/models/wish_list_data.dart';
import 'package:e_commerce/data/models/wish_list_model.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:get/get.dart';
//1. work a controller
//2.pstRequest urls and body cardModels tojson kore pathate hobe.
class ProductWishListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<WishListData>_wishList = [];

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;
  List<WishListData> get wishList => _wishList;

  Future<bool> getWishList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.productWishList,
    );
    if (response.isSuccess) {
      _wishList = WishListModel.fromJson(response.responseData).data??[];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage ?? '';
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
