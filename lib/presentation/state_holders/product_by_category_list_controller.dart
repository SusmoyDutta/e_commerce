import 'dart:developer';

import 'package:e_commerce/data/%20utilits/urls.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/models/product.dart';
import 'package:e_commerce/data/models/product_list_model.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ProductByCategoryListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<Product> _productList = [];

  bool get inProgress => _inProgress;

  List<Product> get productList => _productList;

  String get errorMessage => _errorMessage;

  Future<bool> getProductList(int categoryId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.productByCategory(categoryId),
    );
    log(response.isSuccess.toString());
    log(response.responseCode.toString());
    if (response.isSuccess) {
      _productList =
          ProductListModel.fromJson(response.responseData).productList?? [];
    } else {
      _errorMessage = response.errorMessage ?? 'Home All Category List is Failed';
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
